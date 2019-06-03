<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;

class Comment
{
    /**
     * Получить все комментарии
     *
     * @param string $thread_name
     * @return array
     */
    public static function getCommentsByThreadName(string $thread_name): array
    {
        $query = "select c.*,
                         strfind(c.path, '.') as level
                  from comments c
                  left join threads t on c.thread_id = t.id
                  where t.name = :thread_name
                  order by c.path";

        return DB::select($query, ['thread_name' => $thread_name]);
    }

    /**
     * Добавить комментарий
     *
     * @param string $thread_name
     * @param int|null $parent_comment_id
     * @param string $author_name
     * @param string $text
     */
    public static function add(string $thread_name, ?int $parent_comment_id, string $author_name, string $text): void
    {
        if ($parent_comment_id <= 0) {
            $parent_comment_id = null;
        }

        DB::transaction(function () use ($thread_name, $parent_comment_id, $author_name, $text) {

            $created_at = $updated_at = date('Y-m-d H:i:s');

            $thread = DB::select("select * from threads where `name` = :thread_name", ['thread_name' => $thread_name]);

            // Проверяем существует ли такой thread, если нет добавляем новый
            if (!$thread) {

                // Если "новый thread", то parent_comment_id может быть только null
                if ($parent_comment_id != null) {
                    throw new \Exception('Invalid param parent_comment_id for new thread');
                }

                $thread_id = DB::table('threads')
                    ->insertGetId([
                        'name'       => $thread_name,
                        'created_at' => $created_at,
                        'updated_at' => $updated_at,
                    ]);
            } else {
                $thread_id = $thread[0]->id;
            }

            $comment = DB::select("select * from comments where thread_id = :thread_id and id = :parent_comment_id",
                [
                    'thread_id'         => $thread_id,
                    'parent_comment_id' => $parent_comment_id,
                ]);

            // Если parent_comment_id не существует у текущего thread'a
            if ($thread && !$comment && $parent_comment_id != null) {
                throw new \Exception('Invalid param parent_comment_id with value ' . $parent_comment_id);
            }

            $query = "select c.path,

                        (select (count(*) + 1) as total
                        from comments c2
                        left join threads t2 on c2.thread_id = t2.id
                        where c2.parent_comment_id = c.id and t2.name = t.name) as total
                      from comments c
                      left join threads t on c.thread_id = t.id
                      where c.id = :parent_comment_id and t.name = :thread_name";

            $result = DB::select($query, [
                'thread_name'       => $thread_name,
                'parent_comment_id' => $parent_comment_id,
            ]);

            if (isset($result[0])) {
                $path = $result[0]->path . '.' . $result[0]->total;
            } else {
                $path = '1';
            }

            DB::insert('insert into comments (thread_id, parent_comment_id, author_name, text, path, created_at, updated_at) values (?, ?, ?, ?, ?, ?, ?)',
                [
                    $thread_id,
                    $parent_comment_id,
                    $author_name,
                    $text,
                    $path,
                    $created_at,
                    $updated_at,
                ]);
        });
    }
}
