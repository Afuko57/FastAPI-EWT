python -m pip install virtualenv 
python -m venv env 

pip install uvicorn[standard]

uvicorn main:app --reload


pip install sqlalchemy mysql-connector-python


--------------------------------------------------

INSERT INTO `ewt_data2` (`productID`, `productName`, `ewt_current_value`, `ewt_alert_value`, `ewt_config_status`) VALUES 
('1',  'All', '20', '10', '1'),
('1',  'All', '20', '10', '0'),
('1',  'All', '5', '10', '1'),
('2',  'tmh_post', '20', '10', '1'),
('2',  'tmh_post', '20', '10', '0'),
('2', 'tmh_post', '5', '10', '1'),
('2',  'tmh_pre', '20', '10', '1'),
('2',  'tmh_pre', '20', '10', '0'),
('2',  'tmh_pre', '5', '10', '1'),
('2',  'tol', '20', '10', '1'),
('2',  'tol', '20', '10', '0'),
('2',  'tol', '5', '10', '1'),
('2',  'tvs', '20', '10', '1'),
('2',  'tvs', '20', '10', '0'),
('2',  'tvs', '5', '10', '1'),
('3', 'tmh_pros', '20', '10', '1'),
('3', 'tmh_pros', '20', '10', '0'),
('3',  'tmh_pros', '5', '10', '1'),
('3',  'tol_pros', '20', '10', '1'),
('3',  'tol_pros', '20', '10', '0'),
('3',  'tol_pros', '5', '10', '1'),
('3',  'tvs_pros', '20', '10', '1'),
('3',  'tvs_pros', '20', '10', '0'),
('3',  'tvs_pros', '5', '10', '1')

------------------------------------------------------------
sqlOLD = "SELECT pointID, pointAlert, productName, ewt_config_status, ewt_current_value, ewt_alert_value FROM ewt_test WHERE pointAlert = %s"

#UPDATE ewt_data2 SET ewt_config_status = 1 WHERE productID = 2 LIMIT 1;

sql = "SELECT ewt_data.pointID, ewt_data.pointAlert, ewt_data2.
   productName,ewt_data2.ewt_current_value,ewt_data2.ewt_alert_value,ewt_data2.ewt_config_status FROM ewt_data JOIN ewt_data2 ON ewt_data.pointID = ewt_data2.productID = %s"
------------------------------------------------------------