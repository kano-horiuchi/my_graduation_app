import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import SearchFormController from "./search_form_controller"
application.register("search-form", SearchFormController)
