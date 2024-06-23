from locust import HttpUser, TaskSet, task, between

class UserBehavior(TaskSet):
    @task(1)
    def get_api(self):
        self.client.get("/movie/movies/comingSoonMovies", verify=False)

class WebsiteUser(HttpUser):
    tasks = [UserBehavior]
    wait_time = between(1, 5)
