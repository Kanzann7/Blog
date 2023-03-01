<?php

use App\Model\ArticleModel;
use App\Model\CommentModel;

// Démarrage de la session


//Inclusion des dépendances et de l'autoloader


//Import de classes



//Validation du paramètre id de l'URl

if (!array_key_exists('id', $_GET) || !$_GET['id'] || !ctype_digit($_GET['id'])) {
    http_response_code(404);
    echo 'Article introuvable';
    exit; // Fin de l'exécution du script PHP
}

// Récupération du paramètre id de l'URL
$idArticle = (int) $_GET["id"];
// Récupération de l'article à afficher
$articleModel = new ArticleModel();
$articleId = $articleModel->getOneArticle($idArticle);

if (!$articleId) {
    http_response_code(404);
    echo 'Article introuvable (id ' . $idArticle . ')';
    exit;
}

$articleModel = new ArticleModel();
$commentModel = new CommentModel();
if (!empty($_POST)) {

    // 1. Récupération des donnnées du formulaire
    $nickname = $_POST['nickname'];
    $comment = $_POST['comment'];

    // 2. Validation des données

    $errors = validateCommentForm($nickname, $comment);

    // 3. Traitements des données
    if (!$errors) {

        // Insertion des données

        $commentModel->addComment($nickname, $comment, $idArticle);

        //message flash
        $_SESSION['flashbag'] = "Votre commentaire a bien été ajouté";

        //Redirection vers la page article 
        header('Location: ' . constructUrl('/article', ['id' => $idArticle]));
        exit;
    }
}

// Sélection des commentaires associés à l'article pour les afficher

$comments = $commentModel->getCommentsByArticleId($idArticle);


if (array_key_exists('flashbag', $_SESSION) && $_SESSION['flashbag']) {
    $flashMessage = $_SESSION['flashbag'];
    $_SESSION['flashbag'] = null;
}

$template = 'article';

include '../templates/base.phtml';
