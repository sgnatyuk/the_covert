<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

// Models
use App\Models\Comment;

class HomeController extends Controller
{
    /**
     * @param string $thread_name
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(string $thread_name): \Illuminate\Http\JsonResponse
    {
        $result = Comment::getCommentsByThreadName($thread_name);

        return response()->json($result, 200, [], JSON_PRETTY_PRINT);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function create(Request $request): \Illuminate\Http\JsonResponse
    {
        $this->validate($request, [
            'thread_name'       => 'required',
            'parent_comment_id' => 'nullable|integer',
            'author_name'       => 'required|max:255',
            'text'              => 'required',
        ]);

        try {

            Comment::add(
                $request->thread_name,
                $request->parent_comment_id,
                $request->author_name,
                $request->text
            );

            $result = Comment::getCommentsByThreadName($request->thread_name);

            return response()->json($result, 200, [], JSON_PRETTY_PRINT);

        } catch (\Throwable $e) {

            return response()->json([
                'message' => $e->getMessage(),
            ], 500, [], JSON_PRETTY_PRINT);
        }
    }
}
