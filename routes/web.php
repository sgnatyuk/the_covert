<?php

/* @var Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

use Laravel\Lumen\Routing\Router;

$router->group([
    'prefix' => 'comments'
], function (Router $router) {

    $router->get('{thread_name:.+}', [
        'as' => 'index', 'uses' => 'HomeController@index'
    ]);

    $router->post('/create', [
        'as' => 'create', 'uses' => 'HomeController@create'
    ]);
});
