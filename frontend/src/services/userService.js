import axios from "axios";
import baseUrl  from "./baseURL"

export class UserService {

    // apiUrl = "http://localhost:8080/api/user/users/"

    addCustomer(customer) {
        return axios.post(baseUrl + "user/users/add", customer);
    }

    login(loginDto) {
        return axios.post(baseUrl + "user/users/", loginDto);
    }
}