import os
from fastapi import FastAPI, UploadFile

from starlette.responses import FileResponse


app = FastAPI(name="files")

# dp ='./service/files/cache'
dp = './cache'


@app.post("/upload/")
async def upload(fp: UploadFile):
    open(f'{dp}/{fp.filename}', 'wb').write(await fp.read())
    return {"filename": fp.filename}


@app.get("/file_list")
async def file_list():
    return os.listdir(f'{dp}')


@app.get("/download/{fp}")
async def download(fp):
    fn = f'{dp}/{fp}'
    return FileResponse(fn, filename=fp)
