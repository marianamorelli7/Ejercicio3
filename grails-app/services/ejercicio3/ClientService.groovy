package ejercicio3

import grails.gorm.transactions.Transactional
import groovy.json.JsonSlurper

@Transactional
class ClientService {

    ArrayList<Agency> misAgencias = new ArrayList<>()

    def serviceMethod() {

    }

    def static callApi(String site_id, String payment_methods , String[] near_to ,
                             String criterioOrden) {
        def url = new URL("http://localhost:4567/agencias?" +
                "site_id="+site_id +
                "&payment_methods="+payment_methods +
                "&near_to=" + near_to[1] +"," +near_to[0] +"," + near_to[2] +
                "&criterioOrden=" + criterioOrden)
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozilla/5.0")
        JsonSlurper json = new JsonSlurper()
        def parser = json.parse(connection.getInputStream()).data

        return parser
    }
}
