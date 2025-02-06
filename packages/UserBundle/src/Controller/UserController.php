<?php

namespace Packages\UserBundle\Controller;

use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class UserController extends AbstractController
{
    #[Route('/api/users', name: 'api.user.index')]
    public function index()
    {
        return $this->render('home');
    }
}