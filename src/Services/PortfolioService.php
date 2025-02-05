<?php

namespace App\Services;

use App\Document\Portfolio;
use Doctrine\ODM\MongoDB\DocumentManager;
use Exception;

class PortfolioService
{
    public function __construct(
        protected DocumentManager $documentManager
    ) { }

    public function loadBasicData()
    {
        try {
            $repository = $this->documentManager->getRepository(Portfolio::class);
            $portfolio = $repository->findOneBy([], []);
            return json_encode($portfolio);
        } catch (Exception $e) {
            return json_encode([
                'error' => $e->getMessage()   
            ], JSON_PRETTY_PRINT);
        }
    }
}