"""
Creates, updates, and deletes a job object.
"""


from kubernetes import client



def create_job_object(job_name):
    secret_key_ref = client.V1SecretKeySelector(
        key='admin-user-token', name='influxdb')
    value_from = client.V1EnvVarSource(secret_key_ref=secret_key_ref)

    persistent_volume_claim = client.V1PersistentVolumeClaimVolumeSource(
        claim_name='jmx-nfs-pvc')

    container = client.V1Container(
        name="jmeter",
        image="mx2542/kakax-jmeter:latest",
        command=["./apache-jmeter-5.4.3/bin/jmeter.sh"],
        args=["-n", "-t", "pef-test.jmx"],
        image_pull_policy='IfNotPresent',
        volume_mounts=[client.V1VolumeMount(mount_path='/jmx', name='jmx')],
        env=[client.V1EnvVar(name='INFLUXDB_TOKEN', value_from=value_from)])

    template = client.V1PodTemplateSpec(
        metadata=client.V1ObjectMeta(labels={"app": "jmeter"}),
        spec=client.V1PodSpec(
            restart_policy="Never",
            containers=[container],
            volumes=[
                client.V1Volume(
                    name='jmx', persistent_volume_claim=persistent_volume_claim)
            ]))

    spec = client.V1JobSpec(
        template=template,
        backoff_limit=4)

    job = client.V1Job(
        api_version="batch/v1",
        kind="Job",
        metadata=client.V1ObjectMeta(name=job_name),
        spec=spec)
    return job


def create_job(api_instance, job):
    resp = api_instance.create_namespaced_job(
        body=job,
        namespace="default")
    return resp


def get_job_status(api_instance, job_name):
    resp = api_instance.read_namespaced_job_status(
        name=job_name,
        namespace="default")
    return resp


def update_job(api_instance, job, job_name):
    job.spec.backoff_limit = 3
    resp = api_instance.patch_namespaced_job(
        name=job_name,
        namespace="default",
        body=job)
    return resp


def delete_job(api_instance, job_name):
    resp = api_instance.delete_namespaced_job(
        name=job_name,
        namespace="default",
        body=client.V1DeleteOptions(
            propagation_policy='Foreground',
            grace_period_seconds=5))
    return resp
