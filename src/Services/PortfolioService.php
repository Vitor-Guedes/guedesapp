<?php

namespace App\Services;

use App\Document\Portfolio;
use Doctrine\ODM\MongoDB\DocumentManager;

class PortfolioService
{
    public function __construct(
        protected DocumentManager $documentManager
    ) { }

    public function loadBasicData()
    {
        $repository = $this->documentManager->getRepository(Portfolio::class);

        $portfolio = $repository->findOneBy([], []);
        
        return json_encode($portfolio);
    }
}