'use strict';

angular.module('app.mainPage', []).directive('appMainPage', [function () {
    return {
        templateUrl: 'modules/main-page/main-page.html'
    };
}]).controller('MainPageCtrl', ['$scope', '$http', function ($scope, $http) {
    $scope.mode = 'dvd';
    $scope.showLoader = false;

    $scope.dvdData = [];
    $scope.clientData = [];

    // $scope.updateDvds = async () => {
    //     $scope.takenOnly = !$scope.takenOnly;
    //     $scope.showLoader = true;
    //     $scope.dvdData = [];
    //
    //     $http.get("http://localhost:8081/lw5/main-json.jsp" + ($scope.takenOnly ? "?taken_only=true" : ""))
    //         .then(response => {
    //             $scope.showLoader = false;
    //             $scope.dvdData = response.data;
    //         });
    // }
    //
    // $scope.updateDvds();
}]);
