<?php

namespace App\Controller;

use App\Services\PortfolioService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class IndexController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(PortfolioService $service): Response
    {
        return new Response($service->loadBasicData());
    }
}