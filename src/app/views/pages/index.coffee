AppView = require 'app/views/app_view'
Style = require 'styles/pages/index'
Menu = require 'app/views/pages/menu'

module.exports = class Index extends AppView

	title: "Codeman _Labs"

	after_render:()->
		@menu = new Menu ".footer"

	constructor:()->
