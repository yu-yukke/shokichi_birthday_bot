import Rails from "@rails/ujs"
import { Application } from 'stimulus'
import AccordionController from 'stimulus-accordion'

import '../css/tailwind.css';
import "controllers"

const application = Application.start()

Rails.start()
application.register('accordion', AccordionController)
