// import 'package:dataflex_erp/models/empresa_model.dart';
import 'package:flutter/material.dart';
import 'package:dataflex_erp/providers/empresas_provider.dart';

class CreateClientsPage extends StatefulWidget {
  @override
  _CreateClientsPageState createState() => _CreateClientsPageState();
}

class _CreateClientsPageState extends State<CreateClientsPage> {
  EmpresasProvider _empresasProvider = new EmpresasProvider();

  String? documentValue;
  String? razonSocialValue;
  String? nombreComercialValue;
  String? apellidoPatValue;
  String? apellidoMatValue;
  String? nombresValue;
  String? direccionValue;
  String? referenciaValue;
  final documentController = TextEditingController(text: "");
  final razonSocialController = TextEditingController();
  final nombreComercialController = TextEditingController();
  final apellidoPatController = TextEditingController();
  final apellidoMatController = TextEditingController();
  final nombresController = TextEditingController();
  final direccionController = TextEditingController();
  final referenciaController = TextEditingController();

  final GlobalKey formKey = GlobalKey<FormState>();

  String _documentoSelec = 'RUC';
  String _paisSelec = 'Perú';
  String _departSelec = 'Lima';
  String _provinciaSelec = 'Lima';
  String _distritoSelec = 'Los Olivos';
  String _canalSelec = 'Mayorista';
  String _giroSelec = 'Medicamentos';
  List<String> _documento = ['RUC', 'DNI'];
  List<String> _paises = ['Perú', 'Bolivia', 'Argentina', 'Chile', 'Colombia'];
  List<String> _departamentos = ['Lima','Tumbes','Lambayeque','Ancash','La libertad'];
  List<String> _provincias = ['Lima','Tumbes','Lambayeque','Ancash','La libertad'];
  List<String> _distritos = ['Los Olivos','Comas','Independencia','La Molina','Santa Anita'];
  List<String> _tipoCanal = ['Mayorista', 'Minorista'];
  List<String> _giroNegocio = ['Medicamentos', 'Abarrotes'];

  late Map<String, dynamic> cliente;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear nuevo cliente', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.save, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, 'clients'),
            splashRadius: 25.0,
          )
        ],
      ),
      body: _addClientForm(),
    );
  }

  Widget _addClientForm() {
    return FutureBuilder(
      future: _empresasProvider.getRespuesta('20100070970'),
      initialData: [],
      builder: (context, AsyncSnapshot snapshot) {
        return Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              _documentDropdown(),
              SizedBox(height: 16.0),
              _documentTextForm(),
              SizedBox(height: 16.0),
              _razonSocialTextForm(),
              SizedBox(height: 16.0),
              _nombreComercialTextForm(),
              SizedBox(height: 16.0),
              _apellidoPaternoTextForm(),
              SizedBox(height: 16.0),
              _apellidoMaternoTextForm(),
              SizedBox(height: 16.0),
              _nombresTextForm(),
              SizedBox(height: 16.0),
              _direccionTextForm(),
              SizedBox(height: 16.0),
              _referenciaTextForm(),
              SizedBox(height: 16.0),
              _paisesDropdown(),
              SizedBox(height: 16.0),
              _departamentosDropdown(),
              SizedBox(height: 16.0),
              _provinciasDropdown(),
              SizedBox(height: 16.0),
              _distritosDropdown(),
              SizedBox(height: 16.0),
              _canalDropdown(),
              SizedBox(height: 16.0),
              _giroDropdown(),
              SizedBox(height: 16.0),
              _contactoTextForm(),
              SizedBox(height: 16.0),
              _email1TextForm(),
              SizedBox(height: 16.0),
              _email2TextForm(),
              SizedBox(height: 16.0),
              _email3TextForm(),
              SizedBox(height: 16.0),
              _telefono1TextForm(),
              SizedBox(height: 16.0),
              _telefono2TextForm(),
              SizedBox(height: 16.0),
              _telefono3TextForm(),
            ],
          ),
        );
      },
    );
  }

  List<DropdownMenuItem<String>> getDocumentDropdown() {
    List<DropdownMenuItem<String>> listaDocument = [ ];
    _documento.forEach((doc) {
      listaDocument.add(DropdownMenuItem(
        child: Text(doc),
        value: doc,
      ));
    });
    return listaDocument;
  }

  Widget _documentDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, width: 1),
          borderRadius: BorderRadius.circular(16.0)
          ),
      child: DropdownButton(
        /* icon: Icon(Icons.keyboard_arrow_down),
        iconSize: 24, */
        underline: Container(),
        isExpanded: true,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        value: _documentoSelec,
        items: getDocumentDropdown(),
        onChanged: (opt) {
          setState(() {
            _documentoSelec = opt.toString();
          });
        },
      ),
    );
  }

  Widget _documentTextForm() {

    return TextFormField(
      controller: documentController,
      style: TextStyle(fontWeight: FontWeight.bold),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            splashRadius: 25.0,
            icon: Icon(Icons.search),
            onPressed: () async {
              Map<String, dynamic> respuesta =
                  await _empresasProvider.getRespuesta(documentController.text);
              cliente = respuesta;
              setState(() {});
              print('la respuesta: $respuesta');
            }),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'documento de identidad',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        hintText: 'Ingrese número de documento',
      ),
      /* onSaved: (value) {
        documentValue = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'LLene este campo';
        }
        return null;
      }, */
    );
  }

  Widget _razonSocialTextForm() {
    return TextFormField(
      controller: razonSocialController
        // ignore: unnecessary_null_comparison
        ..text = cliente != null ? cliente['nombre_o_razon_social'] : '',
        style: TextStyle(fontWeight: FontWeight.bold),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'Nombre o razón social',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        hintText: 'Ingrese nombre o razón social',
      ),
      onSaved: (value) {
        razonSocialValue = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'LLene este campo';
        }
        return null;
      },
    );
  }

  Widget _nombreComercialTextForm() {
    return TextFormField(
      controller: nombreComercialController,
      style: TextStyle(fontWeight: FontWeight.bold),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'Nombre comercial',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        hintText: 'Ingrese nombre comercial',
      ),
      onSaved: (value) {
        nombreComercialValue = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'LLene este campo';
        }
        return null;
      },
    );
  }

  Widget _apellidoPaternoTextForm() {
    return TextFormField(
      controller: apellidoPatController,
      style: TextStyle(fontWeight: FontWeight.bold),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'Apellido paterno',
        labelStyle: TextStyle(
          // fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        hintText: 'Ingrese apellido paterno',
      ),
      onSaved: (value) {
        apellidoPatValue = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'LLene este campo';
        }
        return null;
      },
    );
  }

  Widget _apellidoMaternoTextForm() {
    return TextFormField(
      controller: apellidoMatController,
      style: TextStyle(fontWeight: FontWeight.bold),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'Apellido materno',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        hintText: 'Ingrese apellido materno',
      ),
      onSaved: (value) {
        apellidoMatValue = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'LLene este campo';
        }
        return null;
      },
    );
  }

  Widget _nombresTextForm() {
    return TextFormField(
      controller: nombresController,
      style: TextStyle(fontWeight: FontWeight.bold),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'Nombres',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        hintText: 'Ingrese nombre completo',
      ),
      onSaved: (value) {
        nombresValue = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'LLene este campo';
        }
        return null;
      },
    );
  }

  Widget _direccionTextForm() {
    return TextFormField(
      controller: direccionController
        // ignore: unnecessary_null_comparison
        ..text = cliente != null ? cliente['direccion_completa'] : '',
      style: TextStyle(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'Dirección',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      onSaved: (value) {
        direccionValue = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'LLene este campo';
        }
        return null;
      },
    );
  }

  Widget _referenciaTextForm() {
    return TextFormField(
      controller: referenciaController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'Referencia',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      onSaved: (value) {
        referenciaValue = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'LLene este campo';
        }
        return null;
      },
    );
  }

  List<DropdownMenuItem<String>> getPaisesDropdown() {
    List<DropdownMenuItem<String>> listaPaises = [ ];

    _paises.forEach((pais) {
      listaPaises.add(DropdownMenuItem(
        child: Text(pais),
        value: pais,
      ));
    });

    return listaPaises;
  }

  Widget _paisesDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, width: 1),
          borderRadius: BorderRadius.circular(16.0)),
      child: DropdownButton(
        underline: Container(),
        isExpanded: true,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        value: _paisSelec,
        items: getPaisesDropdown(),
        onChanged: (opt) {
          setState(() {
            _paisSelec = opt.toString();
          });
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> getDepartamentoDropdown() {
    List<DropdownMenuItem<String>> listaDepartamentos = [ ];

    _departamentos.forEach((depart) {
      listaDepartamentos.add(DropdownMenuItem(
        child: Text(depart),
        value: depart,
      ));
    });

    return listaDepartamentos;
  }

  Widget _departamentosDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, width: 1),
          borderRadius: BorderRadius.circular(16.0)),
      child: DropdownButton(
        underline: Container(),
        isExpanded: true,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        value: _departSelec,
        items: getDepartamentoDropdown(),
        onChanged: (opt) {
          setState(() {
            _departSelec = opt.toString();
          });
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> getProvinciasDropdown() {
    List<DropdownMenuItem<String>> listaProvincias = [ ];

    _provincias.forEach((provin) {
      listaProvincias.add(DropdownMenuItem(
        child: Text(provin),
        value: provin,
      ));
    });

    return listaProvincias;
  }

  Widget _provinciasDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, width: 1),
          borderRadius: BorderRadius.circular(16.0)),
      child: DropdownButton(
        underline: Container(),
        isExpanded: true,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        value: _provinciaSelec,
        items: getProvinciasDropdown(),
        onChanged: (opt) {
          setState(() {
            _provinciaSelec = opt.toString();
          });
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> getDistritosDropdown() {
    List<DropdownMenuItem<String>> listaDistritos = [ ];

    _distritos.forEach((distri) {
      listaDistritos.add(DropdownMenuItem(
        child: Text(distri),
        value: distri,
      ));
    });

    return listaDistritos;
  }

  Widget _distritosDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, width: 1),
          borderRadius: BorderRadius.circular(16.0)),
      child: DropdownButton(
        underline: Container(),
        isExpanded: true,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        value: _distritoSelec,
        items: getDistritosDropdown(),
        onChanged: (opt) {
          setState(() {
            _distritoSelec = opt.toString();
          });
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> getCanalDropdown() {
    List<DropdownMenuItem<String>> listaCanal = [ ];

    _tipoCanal.forEach((can) {
      listaCanal.add(DropdownMenuItem(
        child: Text(can),
        value: can,
      ));
    });

    return listaCanal;
  }

  Widget _canalDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, width: 1),
          borderRadius: BorderRadius.circular(16.0)),
      child: DropdownButton(
        underline: Container(),
        isExpanded: true,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        value: _canalSelec,
        items: getCanalDropdown(),
        onChanged: (opt) {
          setState(() {
            _canalSelec = opt.toString();
          });
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> getGiroDropdown() {
    List<DropdownMenuItem<String>> listaGiro = [ ];

    _giroNegocio.forEach((giro) {
      listaGiro.add(DropdownMenuItem(
        child: Text(giro),
        value: giro,
      ));
    });

    return listaGiro;
  }

  Widget _giroDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, width: 1),
          borderRadius: BorderRadius.circular(16.0)),
      child: DropdownButton(
        underline: Container(),
        isExpanded: true,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        value: _giroSelec,
        items: getGiroDropdown(),
        onChanged: (opt) {
          setState(() {
            _giroSelec = opt.toString();
          });
        },
      ),
    );
  }

  Widget _contactoTextForm() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'Contacto',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      onSaved: (value) {},
    );
  }

  Widget _email1TextForm() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'Email 1',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      onSaved: (value) {},
    );
  }

  Widget _email2TextForm() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'Email 2',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      onSaved: (value) {},
    );
  }

  Widget _email3TextForm() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'Email 3',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      onSaved: (value) {},
    );
  }

  Widget _telefono1TextForm() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'Teléfono 1',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      onSaved: (value) {},
    );
  }

  Widget _telefono2TextForm() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'Teléfono 2',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      onSaved: (value) {},
    );
  }

  Widget _telefono3TextForm() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: 'Teléfono 3',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      onSaved: (value) {},
    );
  }
}
