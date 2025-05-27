import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:yarn/model/yarn.dart';
import 'package:image_picker/image_picker.dart';

class Myproject extends StatefulWidget {
  const Myproject({Key? key}) : super(key: key);

  @override
  State<Myproject> createState() => _ProjectCreatePageState();
}

class _ProjectCreatePageState extends State<Myproject> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  final TextEditingController _searchController = TextEditingController();

  late Box<Yarn> yarnBox;
  final Set<int> selectedYarnKeys = {};

  int? selectedNeedleType; // 0: 대바늘, 1: 코바늘

  @override
  void initState() {
    super.initState();
    yarnBox = Hive.box<Yarn>('yarn');
  }

  Future<void> _pickDate(bool isStart) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('프로젝트 정보')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('프로젝트명', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: '예: 겨울 스웨터',
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                validator: (v) => v == null || v.isEmpty ? '필수 입력' : null,
              ),
              const SizedBox(height: 16),
              const Text('설명', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _descController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: '프로젝트에 대한 설명을 입력하세요',
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('시작일', style: TextStyle(fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () => _pickDate(true),
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              hintText: 'mm/dd/yyyy',
                              suffixIcon: Icon(Icons.calendar_today_outlined),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                            child: Text(
                              _startDate == null
                                  ? ''
                                  : '${_startDate!.month}/${_startDate!.day}/${_startDate!.year}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('완료 예정일', style: TextStyle(fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () => _pickDate(false),
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              hintText: 'mm/dd/yyyy',
                              suffixIcon: Icon(Icons.calendar_today_outlined),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                            child: Text(
                              _endDate == null
                                  ? ''
                                  : '${_endDate!.month}/${_endDate!.day}/${_endDate!.year}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text('사용할 털실', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: '털실 검색...',
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 8),
              ValueListenableBuilder(
                valueListenable: yarnBox.listenable(),
                builder: (context, Box<Yarn> box, _) {
                  final allYarns = box.values.toList();
                  final allKeys = box.keys.toList();
                  final search = _searchController.text.trim();
                  final filtered = search.isEmpty
                      ? List.generate(allYarns.length, (i) => i)
                      : List.generate(allYarns.length, (i) => i)
                          .where((i) => allYarns[i].name.contains(search) || allYarns[i].brand.contains(search))
                          .toList();

                  if (allYarns.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('등록된 털실이 없습니다.'),
                    );
                  }
                  return Column(
                    children: filtered.map((i) {
                      final yarn = allYarns[i];
                      final key = allKeys[i] as int;
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          // leading: (yarn.imagePath != null && yarn.imagePath.isNotEmpty)
                          //     ? Image.network(yarn.imagePath, width: 40, height: 40, fit: BoxFit.cover)
                          //     : const Icon(Icons.image_not_supported),
                          title: Text(yarn.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(yarn.brand),
                              Container(
                                margin: const EdgeInsets.only(top: 2),
                                child: Chip(
                                  label: Text(yarn.color),
                                  backgroundColor: Colors.blue.shade50,
                                  padding: EdgeInsets.zero,
                                  visualDensity: VisualDensity.compact,
                                ),
                              ),
                            ],
                          ),
                          trailing: Checkbox(
                            value: selectedYarnKeys.contains(key),
                            onChanged: (val) {
                              setState(() {
                                if (val == true) {
                                  selectedYarnKeys.add(key);
                                } else {
                                  selectedYarnKeys.remove(key);
                                }
                              });
                            },
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 24),
              const Text('사용할 바늘', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<int>(
                      value: 0,
                      groupValue: selectedNeedleType,
                      onChanged: (v) => setState(() => selectedNeedleType = v),
                      title: const Text('대바늘'),
                      subtitle: const Text('4.5mm'),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<int>(
                      value: 1,
                      groupValue: selectedNeedleType,
                      onChanged: (v) => setState(() => selectedNeedleType = v),
                      title: const Text('코바늘'),
                      subtitle: const Text('3.0mm'),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // 프로젝트 생성 로직 (폼 검증 등)
                    if (_formKey.currentState!.validate()) {
                      // Hive에 저장 등
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('프로젝트 만들기', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
