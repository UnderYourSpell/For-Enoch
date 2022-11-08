// This version uses a struct to organize our product information
// and then we create an array of structs
#define _CRT_SECURE_NO_WARNINGS
#include "stdio.h"
#include "string.h"
#include "stdlib.h"

#define MAXENTRIES 100
#define STRMAX 50

typedef struct Product
{
	int ID;
	char name[STRMAX];
} Product;

void AddProduct(int* numProducts, Product* products);
void DelProduct(int* numProducts, Product* products);
void PrintProducts(int* numProducts, Product* products);
void FindProduct(int* numProducts, Product* products);
void swap(int* a, int* b);
void SortProducts(Product* products, int* numProducts);



int main()
{
	Product products[MAXENTRIES];
  Product* productPtr = NULL;
	int choice = 1;
	int numProducts = 0;

  productPtr = (Product*) malloc(MAXENTRIES * sizeof(Product));
  
	  while(choice != 0){

		printf("\n1. Add product\n");
		printf("2. Delete by ID\n");
		printf("3. Print products\n");
		printf("4. Find product name by ID\n");
    printf("5. Sort by ID in ascending order\n");
		printf("0. Quit");
		printf("\n");
    scanf("%d", &choice);
      
		if(choice == 1){
      AddProduct(&numProducts, productPtr);
    }
    else if(choice == 2){
      DelProduct(&numProducts, productPtr);
    }
    else if(choice ==3){
      PrintProducts(&numProducts, productPtr);
    }
    else if(choice == 4){
      FindProduct(&numProducts, productPtr);
    }
    else if(choice == 5){
      SortProducts(productPtr, &numProducts);
    }
  }
	return 0;
}

void AddProduct(int* numProducts, Product* products){
	if (*numProducts < MAXENTRIES){
				printf("Enter ID and name (one word)\n");
				scanf("%d%s", &products[*numProducts].ID, products[*numProducts].name);
				*numProducts += 1;
			}
		
}

void DelProduct(int* numProducts, Product* products){
    printf("Enter the ID of the product to delete\n");
			int targetID;
			scanf("%d", &targetID);
			for (int i = 0; i < *numProducts; i++)
			{
				if (products[i].ID == targetID)
				{
					products[i].ID = products[*numProducts - 1].ID;
					strcpy(products[i].name, products[*numProducts - 1].name);
					*numProducts-=1;
					break;
				}
			}
}

void PrintProducts(int* numProducts, Product* products){
  for (int i = 0; i < *numProducts; i++)
			{
				printf("%d %s\n", products[i].ID, products[i].name);
			}
}

void FindProduct(int* numProducts, Product* products){
  printf("Enter the ID of the product to find the name\n");
			int targetID;
			scanf("%d", &targetID);
			for (int i = 0; i < *numProducts; i++)
			{
				if (products[i].ID == targetID)
				{
					printf("The product name is %s\n", products[i].name);
				}
			}
}

void swap(int* a, int* b){
  int temp = *a;
  *a = *b;
  *b = temp;
}

void SortProducts(Product* products, int* numProducts){
  for (int i = 0; i < *numProducts - 1; i++){
    int indexOfMin = i;
    for (int j = i + 1; j < *numProducts; j++){
        if (products[j].ID < products[indexOfMin].ID)
        indexOfMin = j;
    }
    swap(&products[i], &products[indexOfMin]);
  }
}