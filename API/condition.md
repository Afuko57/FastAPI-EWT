
Data = [
    [1,2,True,"Greeting","Tmh_post"],
    [2,1,False,"selectProduct","Tmh_post"],
    [1,2,False,"selectProduct","Tmh_post"]
      ]   
      #1true 0false


def Check(X):
  if (X[2]==True) and (X[0]>X[1]):
    Flag = 1 
    return Flag 
  elif (X[2]==True) and (X[0]<=X[1]):
    Flag = 2 
    return Flag 
  elif (X[2]==False):
    Flag = 1 
    return Flag 
  
def Checkdesc(X):
  if X == 1 :
    desc = "on"
    return desc 
  else : 
    desc = "Off"
    return desc 

def Display(X):
  print ("pointID :",X[0])
  print ("pointAlert :",X[1])
  print ("productName :" , X[4] )
  print ("flagStatus :", Check(X))
  print ("flagStatusdesc :", Checkdesc(Check(X)))
  

for i in Data:
  Display(i)
  print ("-------------------------------------------")
----------------------------------------------------------------------

data_list = [
    DataListItem(pointID=1, pointAlert="Greeting", productName="Product 1", flagStatus=True, flagStatusDesc="ON"),
    DataListItem(pointID=2, pointAlert="SelectProduct", productName="Product 2", flagStatus=False, flagStatusDesc="OFF"),
    DataListItem(pointID=3, pointAlert="Prospect", productName="Product 3", flagStatus=True, flagStatusDesc="ON"),
]

@app.post("/data/list", response_model=List[DataListItem])
async def get_data_by_point_alert(pointAlert: str):
    sql = "SELECT * FROM ewt_data WHERE pointAlert = %s"
    val = (pointAlert,)

    mycursor.execute(sql, val)
    data = mycursor.fetchall()

    if not data:
        raise HTTPException(status_code=404, detail="Data not found")

    data_list = [
        DataListItem(
            pointID=row[0],
            pointAlert=row[1],
            productName=row[2],
            flagStatus=bool(row[3]),
            flagStatusDesc=row[4]
        )
        for row in data
    ]

    return data_list