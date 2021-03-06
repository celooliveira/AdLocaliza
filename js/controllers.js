App.controller('navCtrl', ['$scope', '$location', function ($scope, $location) {
  $scope.navClass = function (page) {
    var hash = $location.path().substring(1);
        hash = hash.indexOf('edit') === 0 ? 'add' : hash;

    return page === hash ? 'active' : '';
  };
}]);

App.controller('addCtrl', ['$scope', '$http', '$location', '$routeParams', function ($scope, $http, $location, $routeParams) {
  $scope.formTitle = 'Add';

  if ($routeParams.id !== undefined) {
    $http.get('./php/searchById.php?id=' + $routeParams.id).success(function (data) {
      if (data.success === true) {
        $scope.id = data.igreja.id;
        $scope.full_name = data.igreja.full_name;
        $scope.email = data.igreja.email;
        $scope.phone = data.igreja.phone;
        $scope.address = data.igreja.address;
        $scope.formTitle = 'Edit';
      }
    });
  }

  $scope.save = function () {
    $http.post(
      './php/addIgreja.php' +
      '?nome=' + $scope.nome +
	  '&descricao=' + $scope.descricao+
	  '&endereco=' + $scope.endereco+
	  '&cep=' + $scope.cep+
	  '&bairro=' + $scope.bairro+
	  '&cidade=' + $scope.cidade+
	  '&uf=' + $scope.uf+
	  '&telefone=' + $scope.telefone+
	  '&email=' + $scope.email+
	  '&responsavel=' + $scope.responsavel+
	  '&idpagamento=' + $scope.idpagamento+
      '&id=' + $scope.id
    ).success(function (data) {
      $scope.success = data.success;
      $scope.msg = data.msg;
      if (data.success === true && $scope.id > 0) {
        console.log($location.path('/list'));
      }
      frmAdd.reset();
    });
  };
}]);

App.controller('listCtrl', ['$scope', '$http', function ($scope, $http) {
  $http.get('./php/listaIgrejas.php').success(function (data) {
    $scope.igrejas = data;
  });

  $scope.deleteigreja = function (igrejaModel) {
    if (confirm("Tem certeza?")) {
      $http.get('./php/deleteigreja.php?id=' + igrejaModel.id).success(function (data) {
        if (data.success === false) {
          alert(data.msg);
        } else {
          $scope.igrejas.splice($scope.igrejas.indexOf(igrejaModel), 1);
        }
      });
    }
  };

  $scope.$on('searchBroadcast', function (event, args) {
    $scope.filter_nome = args.nome;
    $scope.filter_email = args.email;
    $http.get('./php/listaIgrejas.php?nome=' + $scope.filter_nome + '&email=' + $scope.filter_email).success(function (data) {
      $scope.igrejas = data;
    });
  });
}]);

App.controller('searchCtrl', ['$scope', '$http', function ($scope, $http) {
  $scope.searchigrejas = function (nome, email) {
    $scope.$emit('searchEmit', {nome: nome, email: email});
  };
}]);