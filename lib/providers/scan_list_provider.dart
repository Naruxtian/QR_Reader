import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{

  List <ScanModel> scans = [];
  String tipoSeleccionado = 'geo';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    // Asignar el ID de la base de datos al modelo
    nuevoScan.id = id;
    if(tipoSeleccionado == nuevoScan.tipo){
      scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
  }

  cargarScans() async { 
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async{
    tipoSeleccionado = tipo;
    final scans = await DBProvider.db.getScansByTipo(tipo);
    this.scans = [...scans];
    notifyListeners();

  }

  borrarTodosScans() async{
    await DBProvider.db.deleteAll();
    scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async{
    await DBProvider.db.deleteScan(id);
    cargarScansPorTipo(tipoSeleccionado);
  }

}