from sqlalchemy import create_engine

engine = create_engine ("mysql+mysqlconnector://atita:123@localhost:3306/ewt_db")

conn = engine.connect()


