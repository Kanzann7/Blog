<?php

function asset(string $path)
{
    return BASE_URL . '/' . $path;;
}


function constructUrl(string $path, array $params = [])
{
    $url = BASE_URL . '/index.php' . $path;

    if ($params) {
        $url .= '?' . http_build_query($params);
    }
    return $url;
}










function validateCommentForm(string $nickname, string $comment)
{
    $errors = [];
    if (empty($nickname)) {
        $errors['nickname'] = "Le champ est vide!";
    }

    if (strlen($comment) < 2) {
        $errors['comment'] = "Le champ est vide!";
    }

    if (strlen($comment) > 10) {
        $errors['comment'] = "Le commentaire est trop long !";
    }
    return $errors;
}
