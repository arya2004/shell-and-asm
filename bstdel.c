
#include<stdio.h>

struct node{
    struct node* left;
    struct node* right;
    int data;
};
int FindMax(struct node* a)
{   
    while (a->right!= NULL)
    {
        a = a->right;
    }
    
    return a->data;
}
struct node* Delete(struct node* root, int key)
{
    struct node* temp;
    if(root == NULL){
        printf("no node");
    }
        
    else if(key < root->data)
    {
        root->left = Delete(root->left, key);

    }
    else if(key > root->data)
    {
        root->right = Delete(root->right, key);
    }
    else
    {
        if(root->right && root->left)
        {
            temp = FindMax(root->left);
            root->data = temp->data;
            root->left = Delete(root->left, temp->data);
        }
        else
        {
            temp = root;
            if(root->left == NULL)
            {
                root = root->right;
            }
            if(root->right == NULL)
            {
                root = root->left;
            }
            free(temp);
            
        }
    }
    return(root);
}

struct node* DeleteNon(struct node* root, int key)
{
    struct node* temp;
    struct node* traverse = root;
    if(root == NULL){
        printf("no node");
    }
    while (traverse != NULL)
    {
        if(key < traverse->data)
        {
            traverse = traverse->left;
        }
        else if (key > traverse->data)
        {
            traverse = traverse->right;
        }
        
    }
        
    
    
        if(root->right && root->left)
        {
            temp = FindMax(root->left);
            root->data = temp->data;
            root->left = Delete(root->left, temp->data);
        }
        else
        {
            temp = root;
            if(root->left == NULL)
            {
                root = root->right;
            }
            if(root->right == NULL)
            {
                root = root->left;
            }
            free(temp);
            
        }
    
    return(root);
}