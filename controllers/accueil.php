<?php

use App\Model\ArticleModel;




$articleModel = new App\Model\ArticleModel();
$articles = $articleModel->getAllArticles();






$template = 'accueil';
include '../templates/base.phtml';
