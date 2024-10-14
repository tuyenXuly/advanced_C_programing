#include <stdlib.h>
#include <stdio.h>

struct Node{
    int data;
    struct Node* link;
};
struct Node* top;

void push(int data){
    struct Node* temp = (struct Node*) malloc(sizeof(struct Node));

    if(temp != NULL){
        temp->data = data;
        temp->link = top; // day top xuong duoi
        top = temp; // phan tu moi se la dinh ngan xep
    }
}

int isEmpty(){
    return top == NULL;
}

void pop(){
    struct Node *temp;

    if(top != NULL){
        temp = top;
        top = top->link; // xoa phan tu o dinh ngan xep
        temp->link = NULL; 
        free(temp); // giai phong temp tranh ro ri bo nho
    }
}

void display(){
    struct Node* temp;

    if(top != NULL){
        temp = top;
        while(temp != NULL){
            printf("%d:\n",temp->data);
            temp = temp->link;
        }
    }
}

int main(){
    push(1);
    push(2);
    push(3);
    push(4);
    display();
    pop();
    pop();
    display();
}