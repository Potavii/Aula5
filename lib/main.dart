import 'package:flutter/material.dart';
//Importa o pacote do Flutter que traz os widgets do Material Design
//(MaterialApp, Scaffold, AppBar, Text, etc.)Sem esse import, nenhum
//desses widgets existiria no arquivo

void main() {
  //ponto de entrada do programa dart (primeira função a ser executada)qnd o app Roda
  runApp(const CrachaApp());
  //runApp liga o motor do Flutter para entregar o widget raiz (CrachaApp)

  //pode ser construído em tempo de compilação.
}

class CrachaApp extends StatelessWidget {
  //extends Statelesswidget significa que a classe herda o comportamento de um widget 'sem memória'
  //Ele descreve a tela, mas não guarda nenhum dado que muda sozinho. Porque nome, cargo são fixos

  const CrachaApp({super.key});
  //Construtor da Classe. 'super.key' repassa o parâmetro key para a classe pai, usado pelo flutter
  //para identificar o widget dentro da árvore.
  //Ex: Imagine que vc tem uma lista de tarefas na tela do celular e decide apagar a primeira tarefa.
  //Como o flutter sabe qual tarefa ele deve destruir e quais manter?Ele sabe pq cada widget tem uma 'key' que é única.
  @override
  //avisa ao compilador: este método já existe na classe pai.
  //(StatelessWidget) e estou reescrevendo o compotamento dele
  Widget build(BuildContext context) {
    //build()é o método obrigatório chamado pelo Flutter para desenhar
    //a interface. Recebe um BuildContext (o 'endereço'deste widget na árvore e deve retornar o widget pronto)
    return MaterialApp(
      //Widget raiz que configura o aplicativo inteiro! tema, título, tela inicial, e o visual
      debugShowCheckedModeBanner: false,
      //remove a faixa vermelha 'DEBUG' do canto da tela - só estética
      title: 'Crachá Digital',
      //Título interno do app. Ñ aparece na tela
      home: Scaffold(
        //home define a tela real do app. Scaffold cria o esqueleto padrão,
        // que já reseerva espaço para Appbar e corpo, por exemplo
        appBar: AppBar(
          //região fixa no topo da tela
          title: const Text('Crachá Digital'),
          //texto exibido dentro da Appbar, const porque nunca vai mudar
          //, então Flutter pode reaproveitar esse widget sem crir o título a cada 'redesenho'
        ),
        body: Padding(
          //body é a região principal da página, abaixo de AppBar
          //Paddin cria eespaço interno ao redor do seu conteúdo
          padding: const EdgeInsets.all(24),
          //24pixels de 'respiro' nos quatro lados, entre a borda da tela e o conteúdo
          child: Column(
            //Colum empilha seus filhos verticalmente: primeiro o cartão do crachá, depois o botão
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //Controla o eixo cruzado da coluna (horizontal). 'strech'
            //faz cada filho ocupar toda a largura disponível, é por isso
            //que o cartão e o botão vão preencher a largura da tela, em vez de ficarem
            //do tamanho específico de seu conteúdo
            children: [
              //Faremos a lista de filhos da coluna
              Container(
                //Container é a "caixa" que dará a aparência de cartão ao conjunto de textos
                padding: const EdgeInsets.all(16),
                //espaço interno do Container. Distância entre a borda do cartão e o conteúdo dentro
                decoration: BoxDecoration(
                  //cuida da aparência da caixa (cor de fundo, borda, cantos, etc)
                  color: Colors.blue,
                  //pinta o fundo do containeer
                  borderRadius: BorderRadius.circular(12),
                  //Arredonda os quatro cantos do Container com um raio de 12 pixels
                  border: Border.all(color: Colors.blue.shade50),

                  //Desenha um contorno fino ao redor do container
                ),
                child: const Column(
                  //O container também só aceita um filho - aqui, uma Colum própria, local a este cartão).
                  //Const porque nada aqui dentro vai mudar em tempo de execução
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //Dentro do cartão, o alinhamento à esquerda -
                  children: [
                    //Faremos a lista de filos da coluna
                    Text(
                      'Potavio',
                      style: TextStyle(
                        fontSize: 28,
                        //tamanho da fonte em pixels - bem grande
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    //widget "invisivel" que adiciona um espaço vertical
                    // de 4 pixels entre o nome e o cargo
                    Text(
                      'Tecnico de manutenção',
                      style: TextStyle(
                        fontSize: 16,color: Color.fromARGB(255, 65, 56, 86),
                        //fonte menor cinza indicando uma text box
                      ),
                    ),
                    SizedBox(height: 8),
                    //widget "invisivel" que adiciona um espaço vertical
                    Row(
                      //
                      children:[
                        Icon(Icons.factory, color: Color.fromARGB(255, 180, 99, 59)),
                        //icon é apenas um desenho vetorial de biblioeca material
                        //PUramente visual. Aqui um icone de fabrica
                        SizedBox(width:8),
                        //dentro da row sizedbox(widgt:) cria um espaço horizontal
                        Text('Setor:Manutenção Industrial'),
                        //Textofinal da row 
                      ]
                    )

                  ],
                ),
              ),
              const SizedBox(height: 24),
              //Espaço vertical entre o cartao e o botao
              FilledButton.icon(
                //tipo de botao que ja esta preenchido icone + texto
                onPressed:(){
                  //acao de fallback executada toda vez que o botão é tocado
                  //aqui usamos uma função anonima
                  ScaffoldMessenger.of(context).showSnackBar(
                    //conext pe o endereço desse widget dentro da arvore
                    //showblabla pede para esse scafold exibir um aviso
                    const SnackBar(
                      //SnackBar é o aviso que aparece na parte inferior da tela
                      //mostra as mensagens por alguns segundos
                      content: Text('Acesso liberado!'),
                      //conteudo do sanckbar, aqui apenas um texto simples
                    )
                  );
                },
                icon:const Icon(Icons.lock_open),
                //icone exibido a esquerda do texto
                label:const Text('Liberar Acesso'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
