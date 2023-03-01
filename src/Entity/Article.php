<?php

namespace App\Entity;

use DateTimeImmutable;
use App\Entity\Category;

class Article
{
    private int $id;
    private string $title;
    private string $content;
    private ?string $image;
    private DateTimeImmutable $createdAt;
    private Category $category;


    public function __construct(array $data = [])
    {
        foreach ($data as $propertyName => $value) {
            $setter = 'set' . ucfirst($propertyName);
            if (method_exists($this, $setter)) {
                $this->$setter($value);
            }
        }
    }


    /**
     * Get the value of id
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * Set the value of id
     */
    public function setId(int $id): self
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of title
     */
    public function getTitle(): string
    {
        return $this->title;
    }

    /**
     * Set the value of title
     */
    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get the value of content
     */
    public function getContent(): string
    {
        return $this->content;
    }

    /**
     * Set the value of content
     */
    public function setContent(string $content): self
    {
        $this->content = $content;

        return $this;
    }

    /**
     * Get the value of image
     */
    public function getImage(): ?string
    {
        return $this->image;
    }

    /**
     * Set the value of image
     */
    public function setImage(?string $image): self
    {
        $this->image = $image;

        return $this;
    }

    /**
     * Get the value of createdAt
     */
    public function getCreatedAt(): DateTimeImmutable
    {
        return $this->createdAt;
    }

    /**
     * Set the value of createdAt
     */
    public function setCreatedAt(string |DateTimeImmutable $createdAt): self
    {
        if (is_string($createdAt)) {
            $createdAt = new DateTimeImmutable($createdAt);
        }
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * Get the value of catergoryId
     */
    public function getCategory(): Category
    {
        return $this->category;
    }

    /**
     * Set the value of catergoryId
     */
    public function setCategory(Category $category): self
    {
        $this->category = $category;

        return $this;
    }

    public function getCategoryName(): string
    {
        return $this->category->getName();
    }

    // Retourne la date de création de l'article formatée
    public function getFormattedCreatedAt(): string
    {
        return $this->createdAt->format('d/m/Y');
    }
}
