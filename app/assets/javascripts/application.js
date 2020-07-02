import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

import 'core-js/stable'
import 'regenerator-runtime/runtime'
import "bootstrap"
import "../stylesheets/application"


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")