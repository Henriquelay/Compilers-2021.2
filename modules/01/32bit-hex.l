%%
^0x[0-9a-fA-F]{1,8}$    {return(EXIT_SUCCESS);}
.*                      {return(EXIT_FAILURE);}
