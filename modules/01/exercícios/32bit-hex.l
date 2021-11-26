%%
^0[xX][0-9a-fA-F]{0,8}$ {return(EXIT_SUCCESS);}
.*                      {return(EXIT_FAILURE);}
