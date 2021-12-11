'use strict';

angular.module('app', [
    'ngRoute',
    'app.header',
    'app.mainPage',
    'app.addDvdPage',
    'app.addClientPage',
]).config(function ($routeProvider) {
    $routeProvider
        .when("/main", {templateUrl: "main-page/main-page.html"})
        .when("/add-dvd", {templateUrl: "add-dvd-page/add-dvd-page.html"})
        .when("/add-client", {templateUrl: "add-client-page/add-client-page.html"})
        .otherwise(({redirectTo: '/main'}))
});
