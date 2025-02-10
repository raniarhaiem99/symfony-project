<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\User; 
use Symfony\Component\HttpFoundation\JsonResponse;


class UserController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/users', name: 'user_list')]
    public function listUsers(): JsonResponse
    {
        $users = $this->entityManager->getRepository(User::class)->findAll();
    
        $data = [];
        foreach ($users as $user) {
            $data[] = [
                'id' => $user->getId(),
                'name' => $user->getName(),
            ];
        }
    
        return new JsonResponse($data);
    }
}

