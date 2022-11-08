  #include <stdio.h>

struct Cavern{
  char cavernLetter;
  struct Cavern *north;
  struct Cavern *south;
  struct Cavern *east;
  struct Cavern *west;
  
};


int main(void) {
  struct Cavern A,B,C,D,E,F,G,H,I;
  struct Cavern *ptrCavern;

  A.cavernLetter = 'A';
  A.north = NULL;
  A.west = NULL;
  A.south = &B;
  A.east = &C;

  B.cavernLetter = 'B';
  B.north = &A;
  B.east = &C;
  B.south = &E;
  B.west = NULL;

  C.cavernLetter = 'C';
  C.south = &B;
  C.east = &D;
  C.west = NULL;
  C.north = &A;

  D.cavernLetter = 'D';
  D.south = &E;
  D.north = &F;
  D.east = &G;
  D.west = &C;

  E.cavernLetter = 'E';
  E.north = &D;
  E.west = &B;
  E.east = &H;
  E.south = NULL;

  F.cavernLetter = 'F';
  F.south = &D;
  F.north = NULL;
  F.east = NULL;
  F.west = NULL;

  G.cavernLetter = 'G';
  G.east = NULL;
  G.south = &H;
  G.north = NULL;
  G.west = &D;

  H.cavernLetter = 'H';
  H.east = &I;
  H.west = &E;
  H.north = &G;
  H.south = NULL;

  I.cavernLetter = 'I';
  I.east = &H;
  I.north = NULL;
  I.south = NULL;
  I.west = NULL;

  char choice;
  ptrCavern = &A;

  
  while(ptrCavern->cavernLetter != 'I'){
    
    printf("You awaken in a maze of twisty little passages, all alike.\n");
    printf("You can go: ");
    if(ptrCavern->north != NULL){
      printf("North ");
    }
    if(ptrCavern->south != NULL){
      printf("South ");
    }
    if(ptrCavern->east != NULL){
      printf("East ");
    }
    if(ptrCavern->west != NULL){
      printf("West ");
    }
    printf("\n");
    

    while(1){
    char choice = '0';
    scanf("%c",&choice);
    if(choice == 'N' || choice == 'n'){
      ptrCavern = ptrCavern->north;
      break;
    }
    else if(choice == 'S' || choice == 's'){
      ptrCavern = ptrCavern->south;
      break;
    }
    else if(choice == 'E' || choice == 'e'){
      ptrCavern = ptrCavern->east;
      break;
    }
    else if(choice == 'W' || choice == 'w'){
      ptrCavern = ptrCavern->west;
      break;
    }
    else{
    }

      }
    
  }
  printf("You found the exit!\n");



  
  return 0;
}