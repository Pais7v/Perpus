import 'package:flutter/material.dart'; 
 
class ProfileScreen extends StatefulWidget { 
  const ProfileScreen({super.key}); 
 
  @override 
  _ProfileScreenState createState() => _ProfileScreenState(); 
} 
 
class _ProfileScreenState extends State<ProfileScreen> { 
  String? _selectedClass; 
  String? _selectedGender; 
  final List<String> _classes = ['XI PPLG 1', 'XI PPLG 2', 'XI PPLG 3']; 
  final List<String> _genders = ['Male', 'Female', 'Other']; 
 
  final TextEditingController _nameController = TextEditingController(); 
  final TextEditingController _emailController = TextEditingController(); 
 
  @override 
  void dispose() { 
    _nameController.dispose(); 
    _emailController.dispose(); 
    super.dispose(); 
  } 
 
  void _showClassConfirmationDialog(BuildContext context) { 
    showDialog( 
      context: context, 
      builder: (BuildContext context) { 
        return AlertDialog( 
          title: const Text('Confirm Class'), 
          content: Text('You have selected $_selectedClass. Do you want to proceed?'), 
          actions: <Widget>[ 
            TextButton( 
              onPressed: () { 
                Navigator.of(context).pop(); 
              }, 
              child: const Text('Cancel'), 
            ), 
            TextButton( 
              onPressed: () { 
                setState(() {}); 
                Navigator.of(context).pop(); 
              }, 
              child: const Text('Yes'), 
            ), 
          ], 
        ); 
      }, 
    ); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar( 
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        leading: IconButton( 
          icon: const Icon(Icons.arrow_back, color: Colors.black), 
          onPressed: () { 
            Navigator.pop(context); 
          }, 
        ), 
        title: const Text('Edit Profile'), 
        centerTitle: false, 
        actions: [ 
          TextButton( 
            onPressed: () { 
              // Save action 
            }, 
            child: const Text('Save', style: TextStyle(color: Colors.blue)), 
          ), 
        ], 
      ), 
      body: Padding( 
        padding: const EdgeInsets.all(16.0), 
        child: Column( 
          children: [ 
            const Center( 
              child: CircleAvatar( 
                radius: 50, 
                backgroundImage: AssetImage('assets/profile.jpg'), 
              ), 
            ), 
            const SizedBox(height: 20), 
            ProfileTextField( 
              label: 'Name', 
              keyboardType: TextInputType.name, 
              controller: _nameController, 
            ), 
            const SizedBox(height: 20), 
            ProfileTextField( 
              label: 'Your Email', 
              keyboardType: TextInputType.emailAddress, 
              controller: _emailController, 
            ), 
            const SizedBox(height: 20), 
            DropdownButtonFormField<String>( 
              decoration: const InputDecoration( 
                labelText: 'Gender', 
                border: OutlineInputBorder(), 
              ), 
              value: _selectedGender, 
              items: _genders.map((String gender) { 
                return DropdownMenuItem<String>( 
                  value: gender, 
                  child: Text(gender), 
                ); 
              }).toList(), 
              onChanged: (newValue) { 
                setState(() { 
                  _selectedGender = newValue; 
                }); 
              }, 
            ), 
            const SizedBox(height: 20), 
            DropdownButtonFormField<String>( 
              decoration: const InputDecoration( 
                labelText: 'Select Class', 
                border: OutlineInputBorder(), 
              ), 
              value: _selectedClass, 
              items: _classes.map((String className) { 
                return DropdownMenuItem<String>( 
                  value: className, 
                  child: Text(className), 
                ); 
              }).toList(), 
              onChanged: (newValue) {
                setState(() { 
                  _selectedClass = newValue; 
                }); 
              }, 
            ), 
            const Spacer(), 
            ElevatedButton( 
              onPressed: () { 
                _showClassConfirmationDialog(context); 
              }, 
              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 82, 137, 215),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // Atur radius sesuai kebutuhan Anda
                                  ),
                                ),
                                child: SizedBox(
                                  width: 200, // Atur lebar sesuai kebutuhan Anda
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),
            ), 
            const SizedBox(height: 40), 
          ], 
        ), 
      ), 
    ); 
  } 
} 
 
class ProfileTextField extends StatelessWidget { 
  final String label; 
  final bool obscureText; 
  final TextInputType keyboardType; 
  final TextEditingController controller; 
 
  const ProfileTextField({ 
    Key? key, 
    required this.label, 
    this.obscureText = false, 
    this.keyboardType = TextInputType.text, 
    required this.controller, 
  }) : super(key: key); 
 
  @override 
  Widget build(BuildContext context) { 
    return TextField( 
      controller: controller, 
      decoration: InputDecoration( 
        labelText: label, 
        border: const OutlineInputBorder(), 
      ), 
      obscureText: obscureText, 
      keyboardType: keyboardType, 
    ); 
  } 
}