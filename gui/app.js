'use strict';

angular.module('app', [
    'ngRoute',
    'app.header',
    'app.mainPage',
    'app.addDvdPage',
    'app.addClientPage',
]).config(function ($routeProvider) {
    $routeProvider
        .when("/main", {templateUrl: "modules/main-page/main-page.html"})
        .when("/add-dvd", {templateUrl: "modules/add-dvd-page/add-dvd-page.html"})
        .when("/add-client", {templateUrl: "modules/add-client-page/add-client-page.html"})
        .otherwise(({redirectTo: '/main'}))
});
