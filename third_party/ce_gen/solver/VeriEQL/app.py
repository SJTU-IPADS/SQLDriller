import os
import docker

class VerieqlApp:
    def __init__(self):
        self.container_id = "verieql"
        pass
    
    def __enter__(self):
        self.client = docker.from_env()
        # image, _ = self.client.images.build(path='.', tag='my_test_image')
        return self

    def __exit__(self, type, value, traceback):
        # os.system("docker-compose stop")
        pass

    def connect(self):
        return self

    def stop(self):
        pass

    def run(self, sql1: str, sql2: str, schema: str, constraint: str, row_num: int, timeout: int) -> str:
        # command = "python /verieql/main.py -sql1=\"{}\" -sql2=\"{}\" -schema=\"{}\" -constraint=\"{}\" -ROW_NUM={} -timeout={}".format(
        #     sql1,
        #     sql2,
        #     schema,
        #     constraint,
        #     row_num,
        #     timeout
        # )
        
        # hack for filter_insert

        constraint = constraint.replace(r"\n", " ")
        command = ["timeout", f"{timeout+5}s", "python", "/verieql/main.py", f"-sql1={sql1}", f"-sql2={sql2}", f"-schema={schema}", f"-constraint={constraint}", f"-ROW_NUM={row_num}", f"-timeout={timeout}"]
        try:
            exec_id = self.client.containers.get(self.container_id).exec_run(command, stdout=True, stderr=True)
        except Exception as e:
            print("%s" % e)
        return exec_id.output.decode('utf-8')

