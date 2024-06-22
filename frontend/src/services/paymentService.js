import axios from "axios";
import baseUrl  from "./baseURL"

export class PaymentService {

    // apiUrl = "http://localhost:8080/api/movie/payments/"

    sendTicketDetail(ticketDetail) {
        return axios.post(baseUrl + "movie/payments/sendTicketDetail", ticketDetail);
    }
}