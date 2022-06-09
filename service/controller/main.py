from fastapi import FastAPI
from kubernetes import client, config
from fastapi.middleware.cors import CORSMiddleware


from job import *


app = FastAPI()


origins = [
    "http://localhost",
    "http://localhost:8080",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# config.load_incluster_config()
config.load_kube_config()
batch_v1 = client.BatchV1Api()


@app.get("/")
async def Hello():
    return {"Hello": "World"}


@app.post("/jobs/{job_name}")
async def job_create(job_name):
    job = create_job_object(job_name)
    resp = create_job(batch_v1, job)
    return resp.status.to_dict()


@app.get("/jobs/{job_name}")
async def job_status(job_name):
    resp = get_job_status(batch_v1, job_name)
    return resp.status.to_dict()


@app.patch("/jobs/{job_name}")
async def job_update(job_name):
    job = create_job_object(job_name)
    resp = update_job(batch_v1, job, job_name)
    return resp.status.to_dict()


@app.delete("/jobs/{job_name}")
async def job_delete(job_name):
    resp = delete_job(batch_v1, job_name)
    return resp.status
