<?php

namespace App\Model;

use App\Core\AbstractModel;
use App\Entity\Comment;

class CommentModel extends AbstractModel
{





    function addComment(string $nickname, string $comment, $articleId)
    {


        $sql = 'INSERT INTO comment
            (nickname, content, articleId, createdAt) 
            VALUES (?,?,?, NOW())';

        $this->db->prepareAndExecute($sql, [$nickname, $comment, $articleId]);
    }
    function getCommentsByArticleId(int $idArticle)
    {
        // Connexion à la BDD


        $sql = 'SELECT * 
            FROM comment 
            WHERE articleId = ?
            ORDER BY createdAt DESC';




        $results = $this->db->getAllResults($sql, [$idArticle]);
        $comments = [];
        foreach ($results as $result) {
            $comments[] = new Comment($result);
            return $comments;
        }
    }
}
