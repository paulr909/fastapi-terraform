import redis
from fastapi import FastAPI

app = FastAPI()
r = redis.Redis(host="redis", port=6379)


@app.get("/")
def read_root():
    return {"Ping...": "Pong"}


@app.get("/hits")
def get_hits():
    r.incr("hits")
    return {"Number of hits": r.get("hits")}
