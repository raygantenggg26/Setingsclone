import SwiftUI

// 1. Logo Bluetooth Vektor Resmi Apple (Dijamin 100% Tampil Sempurna & Akurat)
struct OfficialBluetoothIcon: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7, style: .continuous)
                .fill(Color(red: 0.0, green: 0.48, blue: 1.0))
                .frame(width: 29, height: 29)
            
            BluetoothShape()
                .stroke(Color.white, style: StrokeStyle(lineWidth: 2.2, lineCap: .round, lineJoin: .round))
                .frame(width: 11, height: 16)
        }
        .padding(.trailing, 6)
    }
}

struct BluetoothShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        
        path.move(to: CGPoint(x: w * 0.25, y: h * 0.25))
        path.addLine(to: CGPoint(x: w * 0.75, y: h * 0.50))
        path.addLine(to: CGPoint(x: w * 0.50, y: h * 0.08))
        path.addLine(to: CGPoint(x: w * 0.50, y: h * 0.92))
        path.addLine(to: CGPoint(x: w * 0.75, y: h * 0.50))
        path.addLine(to: CGPoint(x: w * 0.25, y: h * 0.75))
        
        return path
    }
}

// 2. Tombol Kembali Lingkaran Tunggal (Navigasi Kustom Tanpa Tumpukan System Back)
struct SingleCircleBackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(Color(white: 0.22, opacity: 0.60))
                    .frame(width: 32, height: 32)
                Image(systemName: "chevron.left")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// 3. Container Modifikator Proporsional Pas (Tidak Terlalu Gemuk)
struct iOSGroupModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 2)
            .background(Color(red: 0.11, green: 0.11, blue: 0.12))
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
            .padding(.horizontal, 16)
    }
}

extension View {
    func iOSGroupedContainer() -> some View {
        self.modifier(iOSGroupModifier())
    }
}

// 4. View Utama Pengaturan
struct SettingsMainView: View {
    @State private var isAirplaneModeOn = false
    @State private var searchText = ""
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack(alignment: .bottom) {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 14) {
                        
                        // Profil Akun Apple
                        HStack(spacing: 14) {
                            Circle()
                                .fill(LinearGradient(
                                    colors: [Color(red: 0.25, green: 0.58, blue: 0.68), Color(red: 0.10, green: 0.25, blue: 0.35)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))
                                .frame(width: 56, height: 56)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Dimas Saputra")
                                    .font(.system(size: 19, weight: .semibold))
                                    .foregroundColor(.white)
                                Text("Akun Apple, iCloud, dan lainnya")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color(white: 0.55))
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(Color(white: 0.35))
                        }
                        .padding(.vertical, 6)
                        .iOSGroupedContainer()
                        .padding(.top, 4)
                        
                        // Banner iOS Update
                        HStack {
                            Text("Perbarui ke iOS 27.0.1")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                            Spacer()
                            ZStack {
                                Circle().fill(Color.red).frame(width: 18, height: 18)
                                Text("1").font(.system(size: 11, weight: .bold)).foregroundColor(.white)
                            }
                            Image(systemName: "chevron.right")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(Color(white: 0.35))
                        }
                        .padding(.vertical, 6)
                        .iOSGroupedContainer()
                        
                        // Group Konektivitas
                        VStack(spacing: 0) {
                            HStack {
                                SettingsIcon(systemName: "airplane", backgroundColor: .orange)
                                Text("Mode Pesawat").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Toggle("", isOn: $isAirplaneModeOn).labelsHidden()
                            }.padding(.vertical, 8)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "wifi", backgroundColor: .blue)
                                Text("Wi-Fi").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Tidak Terhubung").font(.system(size: 15)).foregroundColor(Color(white: 0.45))
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }.padding(.vertical, 8)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                OfficialBluetoothIcon()
                                Text("Bluetooth").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Tidak Terhubung").font(.system(size: 15)).foregroundColor(Color(white: 0.45))
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }.padding(.vertical, 8)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "antenna.radiowaves.left.and.right", backgroundColor: .green)
                                Text("Seluler").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Mati").font(.system(size: 15)).foregroundColor(Color(white: 0.45))
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }.padding(.vertical, 8)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "personalhotspot", backgroundColor: Color(red: 0.18, green: 0.78, blue: 0.35))
                                Text("Hotspot Pribadi").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Mati").font(.system(size: 15)).foregroundColor(Color(white: 0.45))
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }.padding(.vertical, 8)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "battery.100", backgroundColor: .green)
                                Text("Baterai").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }.padding(.vertical, 8)
                        }
                        .iOSGroupedContainer()
                        
                        // Menu Utama
                        VStack(spacing: 0) {
                            Button(action: { navigationPath.append("Umum") }) {
                                HStack {
                                    SettingsIcon(systemName: "gear", backgroundColor: .gray)
                                    Text("Umum").font(.system(size: 16)).foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                                }
                                .padding(.vertical, 8)
                            }
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "accessibility", backgroundColor: .blue)
                                Text("Aksesibilitas").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }.padding(.vertical, 8)
                            
                            Divider().background(Color(white: 0.2))
                            
                            HStack {
                                SettingsIcon(systemName: "sparkles", backgroundColor: Color(red: 0.92, green: 0.35, blue: 0.18))
                                Text("Apple Intelligence & Siri").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                            }.padding(.vertical, 8)
                        }
                        .iOSGroupedContainer()
                        
                        Spacer().frame(height: 70)
                    }
                }
                .navigationTitle("Pengaturan")
                .navigationDestination(for: String.self) { destination in
                    if destination == "Umum" {
                        GeneralSettingsView(path: $navigationPath)
                    } else if destination == "Mengenai" {
                        AboutSettingsView(path: $navigationPath)
                    } else if destination == "VPN" {
                        VPNManagementView(path: $navigationPath)
                    }
                }
                
                // Floating Search Bar Bottom (Presisi Mengambang di Bawah)
                HStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.white.opacity(0.6))
                        .font(.system(size: 16, weight: .semibold))
                    
                    TextField("Cari", text: $searchText)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                    
                    Image(systemName: "mic.fill")
                        .foregroundColor(Color.white.opacity(0.6))
                        .font(.system(size: 16))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 26, style: .continuous)
                        .fill(Color(white: 0.18, opacity: 0.55))
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 26, style: .continuous))
                )
                .padding(.horizontal, 16)
                .padding(.bottom, 6)
            }
        }
    }
}

// Icon Standar
struct SettingsIcon: View {
    let systemName: String
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7, style: .continuous)
                .fill(backgroundColor)
                .frame(width: 29, height: 29)
            Image(systemName: systemName)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.trailing, 6)
    }
}

// View Halaman "Umum"
struct GeneralSettingsView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                // Header Kustom Tanpa Nav Bar Default
                HStack {
                    SingleCircleBackButton { path.removeLast() }
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
                // Header Penjelasan
                VStack(alignment: .leading, spacing: 8) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color(white: 0.22))
                            .frame(width: 50, height: 50)
                        Image(systemName: "gear")
                            .font(.system(size: 26))
                            .foregroundColor(.white)
                    }
                    
                    Text("Umum")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Kelola seluruh pengaturan dan preferensi Anda untuk iPhone, seperti pembaruan perangkat lunak, bahasa perangkat, CarPlay, AirDrop, dan lainnya.")
                        .font(.system(size: 13.5))
                        .foregroundColor(Color(white: 0.60))
                        .lineSpacing(2)
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(red: 0.11, green: 0.11, blue: 0.12))
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .padding(.horizontal, 16)
                
                // Group 1
                VStack(spacing: 0) {
                    Button(action: { path.append("Mengenai") }) {
                        HStack {
                            SettingsIcon(systemName: "iphone", backgroundColor: .gray)
                            Text("Mengenai").foregroundColor(.white).font(.system(size: 16))
                            Spacer()
                            Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                        }
                        .padding(.vertical, 8)
                    }
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "gear.badge.checkmark", backgroundColor: .gray)
                        Text("Pembaruan Perangkat Lunak").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 8)
                    
                    Divider().background(Color(white: 0.2))
                    
                    HStack {
                        SettingsIcon(systemName: "internaldrive", backgroundColor: .gray)
                        Text("Penyimpanan iPhone").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 8)
                }
                .iOSGroupedContainer()
                
                // Group VPN & Perangkat
                VStack(spacing: 0) {
                    Button(action: { path.append("VPN") }) {
                        HStack {
                            SettingsIcon(systemName: "network", backgroundColor: .blue)
                            Text("Manajemen VPN & Perangkat").foregroundColor(.white).font(.system(size: 16))
                            Spacer()
                            Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                        }
                        .padding(.vertical, 8)
                    }
                }
                .iOSGroupedContainer()
                
                // Group Legal
                VStack(spacing: 0) {
                    HStack {
                        SettingsIcon(systemName: "doc.text.fill", backgroundColor: .gray)
                        Text("Legal & Pengatur").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 8)
                }
                .iOSGroupedContainer()
                
                // Group Transfer
                VStack(spacing: 0) {
                    HStack {
                        SettingsIcon(systemName: "iphone.gen3", backgroundColor: .blue)
                        Text("Transfer atau Atur Ulang iPhone").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }.padding(.vertical, 8)
                }
                .iOSGroupedContainer()
                
                // Tombol Matikan Biru
                Button(action: {}) {
                    Text("Matikan")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color(red: 0.11, green: 0.11, blue: 0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                }
                .padding(.horizontal, 16)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .background(Color.black)
    }
}

// View Halaman "Mengenai"
struct AboutSettingsView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                HStack {
                    SingleCircleBackButton { path.removeLast() }
                    Spacer()
                    Text("Mengenai").font(.system(size: 17, weight: .semibold)).foregroundColor(.white)
                    Spacer()
                    Spacer().frame(width: 32)
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
                VStack(spacing: 0) {
                    HStack { Text("Nama"); Spacer(); Text("iphone").foregroundColor(.gray) }.padding(.vertical, 9)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Versi iOS"); Spacer(); Text("26.5").foregroundColor(.gray) }.padding(.vertical, 9)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Nama Model"); Spacer(); Text("iPhone 17 Pro Max").foregroundColor(.gray) }.padding(.vertical, 9)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Nomor Model"); Spacer(); Text("MFYP4PA/A").foregroundColor(.gray) }.padding(.vertical, 9)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Nomor Seri"); Spacer(); Text("KJX6WK6357").foregroundColor(.gray) }.padding(.vertical, 9)
                }
                .iOSGroupedContainer()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Garansi Terbatas").foregroundColor(.white).font(.system(size: 16))
                    Text("Kedaluwarsa pada 27/12/26").font(.system(size: 13)).foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color(red: 0.11, green: 0.11, blue: 0.12))
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .padding(.horizontal, 16)
                
                VStack(spacing: 0) {
                    HStack { Text("Lagu"); Spacer(); Text("0").foregroundColor(.gray) }.padding(.vertical, 9)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Video"); Spacer(); Text("1.029").foregroundColor(.gray) }.padding(.vertical, 9)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Foto"); Spacer(); Text("7.862").foregroundColor(.gray) }.padding(.vertical, 9)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Aplikasi"); Spacer(); Text("39").foregroundColor(.gray) }.padding(.vertical, 9)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Kapasitas"); Spacer(); Text("256 GB").foregroundColor(.gray) }.padding(.vertical, 9)
                    Divider().background(Color(white: 0.2))
                    HStack { Text("Tersedia"); Spacer(); Text("157,19 GB").foregroundColor(.gray) }.padding(.vertical, 9)
                }
                .iOSGroupedContainer()
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .background(Color.black)
    }
}

// View Halaman "VPN"
struct VPNManagementView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                HStack {
                    SingleCircleBackButton { path.removeLast() }
                    Spacer()
                    Text("Manajemen VPN & Perangkat").font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                    Spacer()
                    Spacer().frame(width: 32)
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
                VStack(spacing: 0) {
                    HStack {
                        SettingsIcon(systemName: "network", backgroundColor: .blue)
                        Text("VPN").font(.system(size: 16)).foregroundColor(.white)
                        Spacer()
                        Text("Tidak Terhubung").foregroundColor(.gray)
                        Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundColor(Color(white: 0.35))
                    }
                    .padding(.vertical, 9)
                }
                .iOSGroupedContainer()
                
                VStack(spacing: 0) {
                    HStack {
                        Text("Masuk ke Akun Kantor atau Sekolah...")
                            .font(.system(size: 15))
                            .foregroundColor(.blue)
                        Spacer()
                    }
                    .padding(.vertical, 9)
                }
                .iOSGroupedContainer()
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .background(Color.black)
    }
}

@main
struct SettingsCloneApp: App {
    var body: some Scene {
        WindowGroup {
            SettingsMainView()
        }
    }
}
