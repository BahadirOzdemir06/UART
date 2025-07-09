# VHDL UART Transmitter (TX) Modülü

## Proje Özeti / Project Summary

Bu modül, VHDL ile yazılmış parametrik bir **UART verici (transmitter)** tasarımıdır. UART protokolü üzerinden seri haberleşme yapılmasını sağlar. Veri göndermek için bir başlatma sinyali verildiğinde, 8 bitlik veri çerçevesi gönderilir ve iletim tamamlandığında bir "done" işareti oluşturulur.

This is a parameterized **UART transmitter** module written in VHDL. It enables serial communication via the UART protocol. Once triggered, it transmits an 8-bit data frame and raises a "done" signal when the transmission is complete.

---

## Açıklama (Türkçe)

Bu modül, RS-232 uyumlu UART protokolüne göre çalışan bir verici birimidir. Gönderilecek veri `din_i` portu ile verilir ve `tx_start_i` sinyali aktif olduğunda iletim başlar. Çıkış `tx_o` pininden bitler sırasıyla gönderilir. `tx_done_tick_o` çıkışı, iletimin başarıyla tamamlandığını belirtir.

Tasarım parametreleri arasında saat frekansı (`c_clkfreq`), baud hızı (`c_baudrate`) ve stop bit sayısı (`c_stopbit`) bulunur. Bu sayede farklı sistemlere kolaylıkla adapte edilebilir.

### Özellikler

- Parametrik saat frekansı ve baudrate
- 8 bit veri iletimi
- 1 veya daha fazla stop bit desteği
- Tamamlanma sinyali: `tx_done_tick_o`
- Asenkron reset

### Portlar

| Port             | Yön  | Açıklama                                  |
|------------------|------|--------------------------------------------|
| clk              | in   | Sistem saat sinyali                        |
| rst_n            | in   | Aktif düşük reset                          |
| din_i            | in   | Gönderilecek 8 bitlik veri                 |
| tx_start_i       | in   | İletimi başlatma sinyali                   |
| tx_o             | out  | UART çıkışı (seri veri)                    |
| tx_done_tick_o   | out  | İletim tamamlandığında yüksek olur         |

### Nasıl Kullanılır

1. `Soru7_UART_tx.vhd` dosyasını projenize ekleyin.
2. `c_clkfreq`, `c_baudrate` ve `c_stopbit` sabitlerini ihtiyaca göre ayarlayın.
3. `din_i` portuna veri verin ve `tx_start_i` sinyalini 1 yaparak iletimi başlatın.
4. `tx_o` pinini dış dünyaya seri iletişim hattı olarak bağlayın.
5. `tx_done_tick_o` çıktısı ile iletimin bittiğini takip edin.

---

## Description (English)

This module is a UART transmitter that operates according to the RS-232 UART protocol. When data is loaded into `din_i` and `tx_start_i` is asserted, transmission begins over the `tx_o` line. A completion pulse is generated on `tx_done_tick_o` when the transmission is done.

The design is parameterized for clock frequency (`c_clkfreq`), baud rate (`c_baudrate`), and number of stop bits (`c_stopbit`), making it flexible for various systems.

### Features

- Configurable clock frequency and baud rate
- 8-bit data transmission
- Supports 1 or more stop bits
- `tx_done_tick_o` pulse on transmission complete
- Asynchronous active-low reset

### Ports

| Port             | Direction | Description                             |
|------------------|-----------|-----------------------------------------|
| clk              | in        | System clock                            |
| rst_n            | in        | Active-low reset                        |
| din_i            | in        | 8-bit data to transmit                  |
| tx_start_i       | in        | Start transmission signal               |
| tx_o             | out       | UART serial output                      |
| tx_done_tick_o   | out       | Goes high for one clock on completion   |

### How to Use

1. Add `Soru7_UART_tx.vhd` to your project.
2. Adjust `c_clkfreq`, `c_baudrate`, and `c_stopbit` as needed.
3. Load `din_i` with data and pulse `tx_start_i` high to start transmission.
4. Connect `tx_o` to the serial output line.
5. Use `tx_done_tick_o` to detect when transmission is complete.

---


