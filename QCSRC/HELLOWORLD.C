#include <except.h>
#include <qmhsndpm.h>
#include <stdlib.h>

void HW_RPG();
int hw_cpp();
void HW_CL();

int main() {
  int rc = 0;
  char key[4];
  int zero = 0;
#pragma exception_handler(API_Failure, 0, 0, _C2_ALL, _CTLA_HANDLE)
  QMHSNDPM("HWD0001", "HWMSGS    *LIBL     ", "", 0, "*COMP     ",
           "*PGMBDY   ", 1, key, &zero);
#pragma disable_handler
  goto stmf_try;
API_Failure:
  rc = 1;

stmf_try:
  HW_RPG();
  rc = hw_cpp() || rc;
  HW_CL();

  exit(rc ? EXIT_FAILURE : EXIT_SUCCESS);
}
