import 'package: flutter / material.dart';


classe Transporte {
  final String titulo;
  final IconData icone;
  const Transporte (this.titulo, this.icone);
}

const List <Transporte> transportes = <Transporte> [
  Transporte ('Carro', Icons.directions_car),
  Transporte ('Bicicleta', Icons.directions_bike),
  Transporte ('Barco', Icons.directions_boat),
  Transporte ('Ônibus', Icons.directions_bus),
  Transporte ('Trem', Icons.directions_railway),
];
void main () => runApp (MeuAplicativo ());

classe MeuAplicativo extends StatelessWidget {
  @sobrepor
  Construir widget (contexto BuildContext) => MaterialApp (
        casa: PrimeiraRota (),
        debugShowCheckedModeBanner: false,
      );
}

classe PrimeiraRota extends StatefulWidget {
  @sobrepor
  PrimeiraRotaState createState () => PrimeiraRotaState ();
}

classe PrimeiraRotaState estende o estado <PrimeiraRota> {
  Transporte transporte = transportes [0];

  void selecionar (Transporte transporteEscolhido) {
    Navigator.push (
      contexto,
      MaterialPageRoute (
        construtor: (contexto) => RotaGenerica (transporteEscolhido),
      ),
    );      
  }

  List <PopupMenuItem <Transporte>> getListaItensMenu () {
    Lista <PopupMenuItem <Transporte>> lista;

    lista = transportes.skip (2) .map (
      (Transporte, transporte) {
        return PopupMenuItem <Transporte> (
          valor: transporte,
          filho: Texto (transporte.titulo),
        );
      },
    ).listar();
    return lista;
  }

  @sobrepor
  Construção de widget (contexto BuildContext) {
    return Scaffold (
      appBar: AppBar (
        principal: IconButton (
          ícone: Ícone (Icons.video_collection),
          onPressed: () => Navigator.push (
            contexto,
            MaterialPageRoute (construtor: (contexto) => RotaGenerica (transportes [0])),
          ),
          dica: 'Coleção de Vídeos',
        ),
        título: Texto ('Primeira Rota'),
        ações: <Widget> [
          IconButton (
            dica: 'Carro',
            ícone: Icon (transportes [0] .icone),
            onPressed: () {
              Navigator.push (
                contexto,
                MaterialPageRoute (
                  construtor: (contexto) => RotaGenerica (transportes [0]),
                ),
              );
            },
          ),

          IconButton (
            dica: 'Bicicleta',
            ícone: Icon (transportes [1] .icone),
            onPressed: () {
              Navigator.push (
                contexto,
                MaterialPageRoute (
                  construtor: (contexto) => RotaGenerica (transportes [1]),
                ),
              );
            },
          ),
          PopupMenuButton <Transporte> (
            onSelected: selecionar,
            itemBuilder: (BuildContext context) => getListaItensMenu (),
          ),
        ],
      ),
      corpo: Preenchimento (
        preenchimento: EdgeInsets.all (16),
        filho: Cartao (this.transporte),
      ),
    );
  }
}
class RotaGenerica extends StatelessWidget {
  Transporte transporte final;

  RotaGenerica (this.transporte);

  @sobrepor

  Construção de widget (contexto BuildContext) {
    return Scaffold (
      appBar: AppBar (
        título: Texto (this.transporte.titulo),
      ),
      corpo: Centro (
        filho: coluna (
          crianças: [
            Cartao (this.transporte),
            ElevatedButton (
          onPressed: () => Navigator.pop (contexto),
          criança: Texto ('Voltar para a Primeira Rota'),
        ),
          ],          
        ),        
      ),
    );
  }
}


class Cartao extends StatelessWidget {
  Transporte transporte final;
  Cartao (this.transporte);
  @sobrepor
  Construção de widget (contexto BuildContext) {
    cartão de retorno (
      cor: Colors.white,
      criança: Centro (
        filho: coluna (
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          filhos: <Widget> [
            Ícone(
              this.transporte.icone,
              tamanho: 128,
              color: Colors.grey [500],
            ),
            Texto(
              this.transporte.titulo,
              style: TextStyle (
                fontSize: 40,
                color: Colors.grey [500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}