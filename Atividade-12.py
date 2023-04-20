ver = False
while ver == False:

    try:
        Nome = input('Digite o nome completo:')
        Nascim = int(input('Digite o ano que nasceu:'))
        print('-----------------------------------------------------------')

        if 1922 <= Nascim <= 2022:
            Nascim = 2023 - Nascim
            print('Olá '+Nome+' seja bem vindo!')
            print('Voce tem ou irá ter '+str(Nascim)+' ano, esse ano.')
            print('-----------------------------------------------------------')
            ver = True
        else:
            raise Exception('Ocorreu um erro, digite corretamente seu ano de nascimento!')

    except Exception as err:
        print(err)
        print('-----------------------------------------------------------')








