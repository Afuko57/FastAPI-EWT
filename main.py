from fastapi import FastAPI
from pydantic import BaseModel
from datetime import datetime
from uuid import UUID
from typing import Optional
import uuid
from pydantic import BaseModel, Field
from typing import List
import random
import mysql.connector

dbcon = mysql.connector.connect(
    host="localhost",
    user="atita",
    password="123",
    database="ewt_db"
)

mycursor = dbcon.cursor()

app = FastAPI()


class DataListItem(BaseModel):
    pointID: int  # 1 = Greeting, 2 = after select product, 3 = after select menu agent press 0, 4 = prospect
    pointAlert: str  # Greeting selectProduct Prospect
    productName: str
    flagStatus: bool = True  # 1 = ON, 0 = OFF
    flagStatusDesc: str  # ON, OFF


class ErrorCode(BaseModel):
    code: str  # Ex. 0, 101
    message: str  # Success, Data not found


class CheckFlagEWTRequest(BaseModel):
    method: str
    transactionId: str = f"{datetime.now().strftime('%Y%m%d-%H:%M')}-{str(random.randint(0, 9999)).zfill(4)}"
    errorCode: ErrorCode
    dataList: List[DataListItem]


class CheckFlagEWTResponse(BaseModel):
    data: CheckFlagEWTRequest


@app.get("/")
async def root():
    return {"Hello": "World"}

@app.post("/CheckFlagEWT", response_model=CheckFlagEWTResponse)
async def get_data_by_point_alert(pointAlert: str):
    sql = "SELECT ewt_data.pointID, ewt_data.pointAlert, ewt_data2.productName,ewt_data2.ewt_current_value,ewt_data2.ewt_alert_value,ewt_data2.ewt_config_status FROM ewt_data JOIN ewt_data2 ON ewt_data.pointID = ewt_data2.productID WHERE ewt_data.pointAlert = %s"
    val = (pointAlert,)
    mycursor.execute(sql, val)
    data = mycursor.fetchall()

    if not data:
        raise HTTPException(status_code=404, detail="Not found")

    data_list = []
    for row in data:
        pointID = row[0]
        ewt_config_status = row[5]
        ewt_current_value = row[3]
        ewt_alert_value = row[4]

        if ewt_config_status == 1 and ewt_current_value > ewt_alert_value:
            flagStatus = "ON"
            flagStatusDesc = "Ewt Config is ON and Current Value is greater than Alert Value"
            message = "Success"
            code = "0"
        elif ewt_config_status == 0:
            flagStatus = "OFF"
            flagStatusDesc = "Ewt Config is OFF"
            message = "Success"
            code = "0"
        elif ewt_config_status == 1 and ewt_current_value <= ewt_alert_value:
            flagStatus = "ON"
            flagStatusDesc = "Ewt Config is ON and Current Value is less than or equal to Alert Value"
            message = "Success"
            code = "0"
        else:
            message = "Error"
            code = "404"

        data_list.append(
            DataListItem(
                pointID=pointID,
                pointAlert=row[1],
                productName=row[2],
                flagStatus=flagStatus,
                flagStatusDesc=flagStatusDesc
            )
        )

    response_data = CheckFlagEWTRequest(
        method="CheckFlagEWT",
        transactionId=f"{datetime.now().strftime('%Y%m%d-%H:%M')}-{str(random.randint(0, 9999)).zfill(4)}",
        errorCode=ErrorCode(code=code, message=message),
        dataList=data_list
    )

    response = CheckFlagEWTResponse(data=response_data)
    return response
