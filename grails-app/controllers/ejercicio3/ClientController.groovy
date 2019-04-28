package ejercicio3

import grails.converters.JSON

class ClientController {

    ArrayList paramsInput = new ArrayList()

    def index() { }

    def getAgencias() {
        paramsInput.clear()

        String site_id = params.site_id
        String payment_methods = params.payment_methods
        String[] near_to = [params.longitud, params.latitud, params.radio]
        Criterio criterioOrden = Criterio.DISTANCE

        if (params.criterioOrden == "address_line") {
            criterioOrden = Criterio.ADDRESS_LINE
        } else if (params.criterioOrden == "agency_code") {
            criterioOrden = Criterio.AGENCY_CODE
        }

        render ClientService.callApi(site_id, payment_methods, near_to, (criterioOrden.getCriterio().toLowerCase())) as JSON


    }


}
