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

$router->get('/', function () {

    dd(
        'API Methods:',
        'GET /comments/{thread_name} - list comments',
        'POST /comments/create - add new comment, request parameters: thread_name: string, author_name: string, text: string, parent_comment_id: integer|null',
        'Example:',
        'http://sgnaty.beget.tech/comments/site.com/page1',
        'http://sgnaty.beget.tech/comments/site.com/page2',
        );
});

$router->group([
    'prefix' => 'comments',
], function (Router $router) {

    $router->get('{thread_name:.+}', [
        'as' => 'index', 'uses' => 'HomeController@index',
    ]);

    $router->post('/create', [
        'as' => 'create', 'uses' => 'HomeController@create',
    ]);
});
