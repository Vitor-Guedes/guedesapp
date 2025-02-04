<?php

declare(strict_types=1);

namespace App\Document;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ODM\MongoDB\Mapping\Annotations as ODM;

#[ODM\Document(collection: 'portfolio')]
class Portfolio
{
    #[ODM\Id]
    public ?string $id = null;
    
    #[ODM\Field]
    public string $name;
    
    #[ODM\Field]
    public string $email;
    
    #[ODM\Field]
    public string $born_date;

    #[ODM\Field]
    public array $hobbies;
}