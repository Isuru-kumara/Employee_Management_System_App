import 'package:flutter/material.dart';
import 'package:employeems/login.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 192, 73, 192),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Edit Profile'),
                value: 'edit_profile',
              ),
              PopupMenuItem(
                child: Text('Logout'),
                value: 'logout',
              ),
            ],
            onSelected: (value) {
              if (value == 'edit_profile') {
                // Navigate to edit profile page
              } else if (value == 'logout') {
                // Navigate to login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Image.asset(
                'assets/logo.png',
                width: 150,
                height: 75,
              ),
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                // Navigate to Dashboard
              },
              selectedTileColor: Color(0xFFECDAED),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text('Employee'),
                    children: [
                      ListTile(
                        title: Text('Add Employee'),
                        onTap: () {
                          // Navigate to Add Employee
                        },
                      ),
                      ListTile(
                        title: Text('Manage Employee'),
                        onTap: () {
                          // Navigate to Manage Employee
                        },
                      ),
                    ],
                    backgroundColor: Color(0xFFECDAED),
                  ),
                  ExpansionTile(
                    title: Text('Departments'),
                    children: [
                      ListTile(
                        title: Text('Add Departments'),
                        onTap: () {
                          // Navigate to Add Departments
                        },
                      ),
                      ListTile(
                        title: Text('Manage Departments'),
                        onTap: () {
                          // Navigate to Manage Departments
                        },
                      ),
                    ],
                    backgroundColor: Color(0xFFECDAED),
                  ),
                  ExpansionTile(
                    title: Text('Payroll'),
                    children: [
                      ListTile(
                        title: Text('Add Salary'),
                        onTap: () {
                          // Navigate to Add Payroll
                        },
                      ),
                      ListTile(
                        title: Text('Manage Salary'),
                        onTap: () {
                          // Navigate to Manage Payroll
                        },
                      ),
                    ],
                    backgroundColor: Color(0xFFECDAED),
                  ),
                  ExpansionTile(
                    title: Text('Calendar'),
                    children: [
                      ListTile(
                        title: Text('Add Event'),
                        onTap: () {
                          // Navigate to Add Departments
                        },
                      ),
                      ListTile(
                        title: Text('Manage Event'),
                        onTap: () {
                          // Navigate to Manage Departments
                        },
                      ),
                    ],
                    backgroundColor: Color(0xFFECDAED),
                  ),
                  ExpansionTile(
                    title: Text('Leave Requests'),
                    children: [
                      ListTile(
                        title: Text('Manage Employees leaves'),
                        onTap: () {
                          // Navigate to Add Departments
                        },
                      ),
                      ListTile(
                        title: Text('Leave History'),
                        onTap: () {
                          // Navigate to Manage Departments
                        },
                      ),
                    ],
                    backgroundColor: Color(0xFFECDAED),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Navigate to login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              selectedTileColor: Color(0xFFECDAED),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 1,
              shrinkWrap: true,
              children: [
                ChartTile(
                  title: 'Completed Projects',
                  chart: _buildColumnChart1(),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                ChartTile(
                  title: 'Employee Attendance',
                  chart: _buildPieChart(),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                ChartTile(
                  title: 'Employee by Deparments',
                  chart: _buildLineChart(),
                  color: Color.fromARGB(255, 199, 59, 199),
                ),
                ChartTile(
                  title: 'Productivity',
                  chart: _buildColumnChart(),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLineChart() {
    final List<charts.Series<LinearSales, int>> seriesList = [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.white,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: [
          LinearSales(0, 5),
          LinearSales(1, 10),
          LinearSales(2, 8),
          LinearSales(3, 15),
          LinearSales(4, 12),
        ],
      ),
    ];

    return Container(
      width: 200,
      height: 150,
      child: charts.LineChart(
        seriesList,
        animate: true,
      ),
    );
  }

  Widget _buildPieChart() {
    final List<charts.Series<LinearSales, int>> seriesList = [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: [
          LinearSales(0, 5),
          LinearSales(1, 10),
          LinearSales(2, 8),
          LinearSales(3, 15),
          LinearSales(4, 12),
        ],
      ),
    ];

    return Container(
      width: 200, // Adjust the width as needed
      height: 150, // Adjust the height as needed
      child: charts.PieChart(
        seriesList,
        animate: true,
      ),
    );
  }

  Widget _buildColumnChart1() {
    final List<charts.Series<LinearSales, String>> seriesList = [
      charts.Series<LinearSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year.toString(),
        measureFn: (LinearSales sales, _) => sales.sales,
        data: [
          LinearSales(0, 10),
          LinearSales(1, 1),
          LinearSales(2, 4),
          LinearSales(3, 15),
          LinearSales(4, 10),
        ],
      ),
    ];

    return Container(
      width: 200, // Adjust the width as needed
      height: 150, // Adjust the height as needed
      child: charts.BarChart(
        seriesList,
        animate: true,
      ),
    );
  }

  // Widget _buildDonutChart() {
  //   final List<charts.Series<LinearSales, int>> seriesList = [
  //     charts.Series<LinearSales, int>(
  //       id: 'Sales',
  //       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
  //       domainFn: (LinearSales sales, _) => sales.year,
  //       measureFn: (LinearSales sales, _) => sales.sales,
  //       data: [
  //         LinearSales(0, 5),
  //         LinearSales(1, 10),
  //         LinearSales(2, 8),
  //         LinearSales(3, 15),
  //         LinearSales(4, 12),
  //       ],
  //     ),
  //   ];

  //   return Container(
  //     width: 200, // Adjust the width as needed
  //     height: 150, // Adjust the height as needed
  //     child: charts.PieChart(
  //       seriesList,
  //       animate: true,
  //       defaultRenderer: charts.ArcRendererConfig(
  //         arcWidth: 60,
  //         arcRendererDecorators: [charts.ArcLabelDecorator()],
  //       ),
  //     ),
  //   );
  // }
}

Widget _buildColumnChart() {
  final List<charts.Series<LinearSales, String>> seriesList = [
    charts.Series<LinearSales, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (LinearSales sales, _) => sales.year.toString(),
      measureFn: (LinearSales sales, _) => sales.sales,
      data: [
        LinearSales(0, 5),
        LinearSales(1, 10),
        LinearSales(2, 8),
        LinearSales(3, 15),
        LinearSales(4, 12),
      ],
    ),
  ];

  return Container(
    width: 200, // Adjust the width as needed
    height: 150, // Adjust the height as needed
    child: charts.BarChart(
      seriesList,
      animate: true,
    ),
  );
}

// Widget _buildLineChart() {
// final List<charts.Series<LinearSales, String>> seriesList = [
//   charts.Series<LinearSales, String>(
//     id: 'Sales',
//     colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//     domainFn: (LinearSales sales, _) => sales.year.toString(), // Convert to String
//     measureFn: (LinearSales sales, _) => sales.sales,
//     data: [
//       LinearSales(0, 5),
//       LinearSales(1, 10),
//       LinearSales(2, 8),
//       LinearSales(3, 15),
//       LinearSales(4, 12),
//     ],
//   ),
// ];

// return Container(
//   width: 200, // Adjust the width as needed
//   height: 150, // Adjust the height as needed
//   child: charts.LineChart(
//     seriesList,
//     animate: true,
//   ),
// );

class ChartTile extends StatelessWidget {
  final String title;
  final Widget chart;
  final Color color;

  ChartTile({required this.title, required this.chart, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 280,
              height: 220,
              color: color,
              child: chart,
            ),
          ),
        ],
      ),
    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
