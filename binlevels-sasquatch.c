// array size is 2700
const char binlevels[]  = {
  0x15, 0x00, 0x04, 0x04, 0x0b, 0x0b, 0x03, 0x00, 0x03, 0x00, 0x68, 0x00, 0x04, 0x04, 0x09, 0x09, 
  0x04, 0x00, 0x04, 0x00, 0x51, 0x00, 0x06, 0x0a, 0x10, 0x0e, 0x0a, 0x00, 0x0a, 0x00, 0x90, 0x00, 
  0x0b, 0x01, 0x0d, 0x0a, 0x09, 0x01, 0x09, 0x00, 0x63, 0x00, 0x07, 0x07, 0x0f, 0x0f, 0x1d, 0x01, 
  0x1d, 0x00, 0xc5, 0x00, 0x07, 0x06, 0x0f, 0x0c, 0x0d, 0x00, 0x0d, 0x00, 0x94, 0x00, 0x05, 0x04, 
  0x13, 0x0a, 0x06, 0x01, 0x06, 0x00, 0x7f, 0x00, 0x01, 0x04, 0x0d, 0x0b, 0x07, 0x03, 0x07, 0x00, 
  0x6d, 0x00, 0x06, 0x03, 0x09, 0x09, 0x05, 0x00, 0x05, 0x00, 0x4b, 0x00, 0x04, 0x02, 0x0b, 0x09, 
  0x06, 0x00, 0x06, 0x00, 0x51, 0x00, 0x05, 0x04, 0x0c, 0x0e, 0x0a, 0x03, 0x0a, 0x00, 0x87, 0x00, 
  0x04, 0x04, 0x0a, 0x08, 0x06, 0x02, 0x06, 0x00, 0x43, 0x00, 0x04, 0x01, 0x0b, 0x0c, 0x07, 0x00, 
  0x07, 0x00, 0x73, 0x00, 0x01, 0x0d, 0x08, 0x0f, 0x18, 0x09, 0x18, 0x00, 0x6d, 0x00, 0x03, 0x04, 
  0x09, 0x08, 0x09, 0x00, 0x09, 0x00, 0x3b, 0x00, 0x0d, 0x03, 0x0f, 0x06, 0x08, 0x02, 0x08, 0x00, 
  0x49, 0x00, 0x04, 0x01, 0x0f, 0x0e, 0x08, 0x00, 0x08, 0x00, 0xa4, 0x00, 0x08, 0x04, 0x11, 0x09, 
  0x0e, 0x00, 0x0e, 0x00, 0x70, 0x00, 0x02, 0x0b, 0x0e, 0x0e, 0x0d, 0x00, 0x0d, 0x00, 0xa1, 0x00, 
  0x0e, 0x03, 0x12, 0x0e, 0x13, 0x01, 0x13, 0x00, 0xab, 0x00, 0x0e, 0x07, 0x12, 0x0b, 0x0c, 0x00, 
  0x0c, 0x00, 0x9d, 0x00, 0x03, 0xa0, 0x03, 0xa3, 0x05, 0xa0, 0x00, 0x02, 0xa0, 0x02, 0xa3, 0xa0, 
  0xa3, 0xa0, 0x04, 0xa3, 0x00, 0xa0, 0x02, 0xa3, 0x02, 0xa0, 0x03, 0xa3, 0x02, 0xa0, 0xa3, 0x00, 
  0x02, 0xa3, 0xa0, 0xa4, 0x06, 0xa0, 0xa3, 0x00, 0xa3, 0x03, 0xa0, 0xc0, 0xa4, 0xa0, 0xa3, 0x02, 
  0xa0, 0xa3, 0x00, 0x03, 0xa3, 0xa0, 0xa4, 0x03, 0xa3, 0x02, 0xa0, 0xa3, 0x00, 0x02, 0xa0, 0xa3, 
  0x02, 0xa0, 0xa3, 0x02, 0xae, 0x02, 0xa0, 0xa3, 0x00, 0xa0, 0x02, 0xa3, 0xa0, 0x02, 0xa3, 0xae, 
  0xa3, 0xa0, 0x02, 0xa3, 0x00, 0xa0, 0xa3, 0x06, 0xa0, 0x02, 0xa3, 0xa0, 0x00, 0xa0, 0xa3, 0x05, 
  0xa0, 0x02, 0xa3, 0x02, 0xa0, 0x00, 0xa0, 0x07, 0xa3, 0x03, 0xa0, 0x00, 0xa0, 0x02, 0xa3, 0xa0, 
  0x05, 0xa3, 0x00, 0x02, 0xa3, 0xa0, 0x02, 0xa3, 0xa0, 0xae, 0xa0, 0xa3, 0x00, 0xa3, 0xa0, 0x02, 
  0xa3, 0xa0, 0xa4, 0xae, 0xa0, 0xa3, 0x00, 0xa0, 0x02, 0xa3, 0xa0, 0xa4, 0x03, 0xa0, 0xa3, 0x00, 
  0x02, 0xa3, 0xa0, 0xa4, 0xc0, 0xa0, 0x03, 0xa3, 0x00, 0xa3, 0xa0, 0xa4, 0x02, 0xa0, 0x02, 0xa3, 
  0x02, 0xa0, 0x00, 0xa3, 0x02, 0xae, 0xa0, 0x02, 0xa3, 0xa0, 0x02, 0xa3, 0x00, 0xa3, 0x03, 0xa0, 
  0xa3, 0xa0, 0x02, 0xa3, 0xa0, 0x00, 0x05, 0xa3, 0xa0, 0xa3, 0x02, 0xa0, 0x00, 0x0b, 0xa0, 0x05, 
  0xa3, 0x00, 0x0a, 0xa0, 0x02, 0xa3, 0x03, 0xa0, 0xa3, 0x00, 0x0a, 0xa0, 0xa3, 0x04, 0xa0, 0xa3, 
  0x00, 0x04, 0xa0, 0x04, 0xa3, 0x02, 0xa0, 0xa3, 0xa0, 0xa4, 0xa0, 0x02, 0xa3, 0x00, 0x04, 0xa0, 
  0xa3, 0x02, 0xa0, 0x04, 0xa3, 0xa4, 0xa0, 0xa4, 0xa3, 0xa0, 0x00, 0x04, 0xa0, 0xa3, 0x05, 0xa0, 
  0xa4, 0xa0, 0xa4, 0xa0, 0xa3, 0xa0, 0x00, 0x03, 0xa0, 0x02, 0xa3, 0xa0, 0x02, 0xa3, 0xa0, 0xa4, 
  0xa0, 0xa4, 0xa0, 0xa4, 0xa3, 0xa0, 0x00, 0x03, 0xa0, 0xa3, 0x02, 0xa0, 0xae, 0xa3, 0x02, 0xa0, 
  0xa4, 0xa0, 0xa4, 0xa0, 0xa3, 0xa0, 0x00, 0x03, 0xa0, 0xa3, 0x02, 0xa0, 0xae, 0xa3, 0x06, 0xa0, 
  0xa3, 0xa0, 0x00, 0x05, 0xa3, 0xa0, 0x09, 0xa3, 0xa0, 0x00, 0xa3, 0x04, 0xae, 0xa0, 0xc0, 0x02, 
  0xa0, 0xa3, 0x06, 0xa0, 0x00, 0xa3, 0x04, 0xae, 0x04, 0xa0, 0xa3, 0x06, 0xa0, 0x00, 0x02, 0xa3, 
  0x02, 0xa0, 0x06, 0xa3, 0x06, 0xa0, 0x00, 0xa0, 0x04, 0xa3, 0x0b, 0xa0, 0x00, 0x02, 0xa0, 0x0b, 
  0xa3, 0x00, 0xa0, 0x02, 0xa3, 0x05, 0xa0, 0xa3, 0x02, 0xa0, 0xc0, 0xa3, 0x00, 0x03, 0xa3, 0xa0, 
  0xa4, 0xa0, 0x02, 0xa4, 0xa3, 0x03, 0xa0, 0xa3, 0x00, 0xa3, 0xa0, 0x02, 0xa3, 0xa4, 0x04, 0xa0, 
  0x02, 0xa4, 0xa0, 0xa3, 0x00, 0xa3, 0x02, 0xa0, 0xa3, 0x02, 0xa0, 0xa4, 0xa0, 0xa3, 0x03, 0xa0, 
  0xa3, 0x00, 0x06, 0xa3, 0xa0, 0x06, 0xa3, 0x00, 0xa3, 0x02, 0xae, 0xa0, 0x02, 0xae, 0xa4, 0xa0, 
  0xa3, 0xaa, 0x02, 0xa3, 0xa0, 0x00, 0xa3, 0xa0, 0x02, 0xae, 0x04, 0xa0, 0x03, 0xa3, 0x02, 0xa0, 
  0x00, 0xa3, 0x02, 0xa0, 0x02, 0xae, 0x05, 0xa3, 0x03, 0xa0, 0x00, 0x09, 0xa3, 0x04, 0xa0, 0x00, 
  0x02, 0xa0, 0x0b, 0xa3, 0x02, 0xa0, 0x00, 0xa0, 0x02, 0xa3, 0x04, 0xa0, 0xa3, 0x04, 0xa0, 0x02, 
  0xa3, 0xa0, 0x00, 0x03, 0xa3, 0xa0, 0xa4, 0xa0, 0xa4, 0xa3, 0xa4, 0xa0, 0xa4, 0xa0, 0x03, 0xa3, 
  0x00, 0xa3, 0xa0, 0xa3, 0xa4, 0xa0, 0xa4, 0xa0, 0xa3, 0xa0, 0xa4, 0xa0, 0xa4, 0xa3, 0xa0, 0xa3, 
  0x00, 0xa3, 0xa0, 0xa4, 0x02, 0xa0, 0x02, 0xae, 0xa3, 0x02, 0xae, 0x02, 0xa0, 0xa4, 0xa0, 0xa3, 
  0x00, 0xa3, 0x02, 0xa0, 0xa4, 0x03, 0xae, 0xa3, 0x03, 0xae, 0xa4, 0x02, 0xa0, 0xa3, 0x00, 0xa3, 
  0xa0, 0xa4, 0xa0, 0x02, 0xae, 0xa0, 0xaa, 0xa0, 0x02, 0xae, 0xa0, 0xa4, 0xa0, 0xa3, 0x00, 0x06, 
  0xa3, 0xa0, 0xc0, 0xa0, 0x06, 0xa3, 0x00, 0xa3, 0xa0, 0xa4, 0xa0, 0x02, 0xae, 0x03, 0xa0, 0x02, 
  0xae, 0xa0, 0xa4, 0xa0, 0xa3, 0x00, 0xa3, 0x02, 0xa0, 0xa4, 0x03, 0xae, 0xa3, 0x03, 0xae, 0xa4, 
  0x02, 0xa0, 0xa3, 0x00, 0xa3, 0xa0, 0xa4, 0x02, 0xa0, 0x02, 0xae, 0xa3, 0x02, 0xae, 0x02, 0xa0, 
  0xa4, 0xa0, 0xa3, 0x00, 0xa3, 0xa0, 0xa3, 0xa4, 0xa0, 0xa4, 0xa0, 0xa3, 0xa0, 0xa4, 0xa0, 0xa4, 
  0xa3, 0xa0, 0xa3, 0x00, 0x03, 0xa3, 0xa0, 0xa4, 0xa0, 0xa4, 0xa3, 0xa4, 0xa0, 0xa4, 0xa0, 0x03, 
  0xa3, 0x00, 0xa0, 0x02, 0xa3, 0x04, 0xa0, 0xa3, 0x04, 0xa0, 0x02, 0xa3, 0xa0, 0x00, 0x02, 0xa0, 
  0x0b, 0xa3, 0x02, 0xa0, 0x00, 0x02, 0xa0, 0x0b, 0xa3, 0x02, 0xa0, 0x00, 0x03, 0xa3, 0xae, 0x02, 
  0xa0, 0xae, 0xa4, 0xae, 0x02, 0xa0, 0xae, 0x03, 0xa3, 0x00, 0xa0, 0x02, 0xa3, 0xa0, 0xa4, 0x02, 
  0xa0, 0xa4, 0x02, 0xa0, 0xa4, 0xa0, 0x02, 0xa3, 0xa0, 0x00, 0x02, 0xa0, 0x02, 0xa3, 0xa0, 0x02, 
  0xae, 0xa4, 0x02, 0xae, 0xa0, 0x02, 0xa3, 0x02, 0xa0, 0x00, 0x03, 0xa0, 0x02, 0xa3, 0xa4, 0xa3, 
  0xa4, 0xa3, 0xa4, 0x02, 0xa3, 0x03, 0xa0, 0x00, 0x04, 0xa0, 0xa3, 0xae, 0xa4, 0xa0, 0xa4, 0xae, 
  0xa3, 0x04, 0xa0, 0x00, 0x04, 0xa0, 0xa3, 0x02, 0xa0, 0xc0, 0x02, 0xa0, 0xa3, 0x04, 0xa0, 0x00, 
  0x04, 0xa0, 0x03, 0xa3, 0xa0, 0x03, 0xa3, 0x04, 0xa0, 0x00, 0x03, 0xa0, 0x02, 0xa3, 0xa0, 0xa4, 
  0xa0, 0xa4, 0xa0, 0x02, 0xa3, 0x03, 0xa0, 0x00, 0x03, 0xa0, 0xa3, 0xae, 0x02, 0xa0, 0xa4, 0x02, 
  0xa0, 0xae, 0xa3, 0x03, 0xa0, 0x00, 0x03, 0xa0, 0x03, 0xa3, 0xa0, 0xae, 0xa0, 0x03, 0xa3, 0x03, 
  0xa0, 0x00, 0x05, 0xa0, 0x05, 0xa3, 0x05, 0xa0, 0x00, 0x0b, 0xa0, 0x06, 0xa3, 0x02, 0xa0, 0x00, 
  0x04, 0xa0, 0x04, 0xa3, 0x02, 0xa0, 0x02, 0xa3, 0x04, 0xa0, 0xa3, 0x02, 0xa0, 0x00, 0x02, 0xa0, 
  0x03, 0xa3, 0x02, 0xa0, 0xa3, 0x02, 0xa0, 0xa3, 0x02, 0xa0, 0x02, 0xa3, 0xa0, 0x03, 0xa3, 0x00, 
  0x03, 0xa3, 0x04, 0xa0, 0x04, 0xa3, 0xa0, 0xa3, 0x03, 0xa0, 0xa4, 0xa0, 0xa3, 0x00, 0xa3, 0x02, 
  0xa0, 0xa4, 0xa0, 0xc0, 0xa0, 0x03, 0xae, 0xaa, 0x02, 0xae, 0x02, 0xa0, 0xa4, 0x02, 0xa0, 0xa3, 
  0x00, 0xa3, 0xa0, 0xa4, 0xa0, 0xa4, 0x02, 0xa0, 0x02, 0xa3, 0xa0, 0x03, 0xa3, 0x03, 0xa0, 0x03, 
  0xa3, 0x00, 0x03, 0xa3, 0xa0, 0x03, 0xa3, 0x03, 0xa0, 0xa3, 0xa0, 0x05, 0xa3, 0x02, 0xa0, 0x00, 
  0xa0, 0xa3, 0x06, 0xa0, 0x03, 0xa3, 0x08, 0xa0, 0x00, 0xa0, 0xa3, 0x03, 0xa0, 0x04, 0xa3, 0x0a, 
  0xa0, 0x00, 0xa0, 0x05, 0xa3, 0x0d, 0xa0, 0x00, 0x04, 0xa0, 0x07, 0xa3, 0x02, 0xa0, 0x00, 0x04, 
  0xa0, 0xa3, 0x05, 0xa0, 0x02, 0xa3, 0xa0, 0x00, 0x05, 0xa3, 0xa0, 0x03, 0xa3, 0x02, 0xa0, 0x02, 
  0xa3, 0x00, 0xa3, 0x07, 0xa0, 0xa3, 0x02, 0xa0, 0x02, 0xa3, 0x00, 0xa3, 0xc0, 0xa4, 0x03, 0xaa, 
  0xae, 0xa0, 0x02, 0xa3, 0xa4, 0xa0, 0xa3, 0x00, 0xa3, 0x02, 0xa0, 0xa3, 0x04, 0xa0, 0x02, 0xa3, 
  0xa0, 0xae, 0xa3, 0x00, 0x02, 0xa3, 0x02, 0xa0, 0x02, 0xa3, 0x02, 0xa0, 0xa3, 0xa0, 0xa4, 0xa0, 
  0xa3, 0x00, 0xa0, 0x02, 0xa3, 0x02, 0xa0, 0x04, 0xa3, 0xae, 0xa4, 0xae, 0xa3, 0x00, 0x02, 0xa0, 
  0x02, 0xa3, 0x08, 0xa0, 0xa3, 0x00, 0x03, 0xa0, 0x06, 0xa3, 0x02, 0xa0, 0x02, 0xa3, 0x00, 0x08, 
  0xa0, 0x04, 0xa3, 0xa0, 0x00, 0x09, 0xa3, 0x00, 0xa3, 0xae, 0xa0, 0xae, 0x04, 0xa0, 0xa3, 0x00, 
  0xa3, 0xae, 0xa4, 0xae, 0xa0, 0xae, 0x02, 0xa0, 0xa3, 0x00, 0x02, 0xa3, 0xa0, 0x03, 0xa3, 0xc0, 
  0xa0, 0xa3, 0x00, 0xa0, 0xa3, 0x02, 0xa0, 0xa4, 0x02, 0xa0, 0x02, 0xa3, 0x00, 0xa0, 0xa3, 0xa0, 
  0x02, 0xa4, 0xa0, 0x02, 0xa3, 0xa0, 0x00, 0xa0, 0xa3, 0x02, 0xa0, 0xa4, 0xa0, 0xa3, 0x02, 0xa0, 
  0x00, 0xa0, 0xa3, 0x02, 0xa0, 0x03, 0xa3, 0x02, 0xa0, 0x00, 0xa0, 0x04, 0xa3, 0x04, 0xa0, 0x00, 
  0x02, 0xa0, 0x04, 0xa3, 0x05, 0xa0, 0x00, 0x03, 0xa3, 0x02, 0xa0, 0x04, 0xa3, 0x02, 0xa0, 0x00, 
  0xa3, 0x03, 0xa0, 0xc0, 0x03, 0xa0, 0x02, 0xa3, 0xa0, 0x00, 0xa3, 0xa0, 0xa3, 0xae, 0xa0, 0xae, 
  0xa3, 0xae, 0x03, 0xa3, 0x00, 0xa3, 0xa0, 0x03, 0xa4, 0xa0, 0x03, 0xa4, 0xa0, 0xa3, 0x00, 0x03, 
  0xa3, 0xae, 0xa3, 0xae, 0xa3, 0xae, 0xa3, 0xa0, 0xa3, 0x00, 0xa0, 0x02, 0xa3, 0x07, 0xa0, 0xa3, 
  0x00, 0x02, 0xa0, 0x04, 0xa3, 0x02, 0xa0, 0x03, 0xa3, 0x00, 0x05, 0xa0, 0x04, 0xa3, 0x02, 0xa0, 
  0x00, 0x03, 0xa0, 0x07, 0xa3, 0x02, 0xa0, 0x00, 0xa0, 0x03, 0xa3, 0x05, 0xa0, 0x02, 0xa3, 0xa0, 
  0x00, 0xa0, 0xa3, 0x03, 0xa0, 0x03, 0xa3, 0x02, 0xa0, 0xa3, 0xa0, 0x00, 0xa0, 0xa3, 0x06, 0xa0, 
  0xa3, 0xa0, 0xa3, 0xa0, 0x00, 0x03, 0xa3, 0xa4, 0xa3, 0xc0, 0x02, 0xa0, 0xa3, 0xa0, 0xa3, 0xa0, 
  0x00, 0xa3, 0x03, 0xa0, 0x05, 0xa3, 0xa0, 0xa3, 0xa0, 0x00, 0xa3, 0x03, 0xa0, 0xa3, 0x02, 0xa0, 
  0xaa, 0xae, 0xa0, 0xa3, 0xa0, 0x00, 0x02, 0xa3, 0x02, 0xa4, 0xa3, 0x02, 0xa0, 0xaa, 0xae, 0x02, 
  0xa3, 0xa0, 0x00, 0xa0, 0xa3, 0x05, 0xa0, 0xaa, 0x02, 0xae, 0xa3, 0xa0, 0x00, 0xa0, 0x04, 0xa3, 
  0xa0, 0xa3, 0x03, 0xae, 0x02, 0xa3, 0x00, 0x04, 0xa0, 0xa3, 0xa0, 0xa3, 0x03, 0xa4, 0xa0, 0xa3, 
  0x00, 0x04, 0xa0, 0xa3, 0x03, 0xa0, 0xa4, 0x02, 0xa0, 0xa3, 0x00, 0x04, 0xa0, 0x05, 0xa3, 0x02, 
  0xa0, 0xa3, 0x00, 0x08, 0xa0, 0x04, 0xa3, 0x00, 0xa0, 0x07, 0xa3, 0x02, 0xa0, 0x00, 0x02, 0xa3, 
  0x05, 0xa0, 0xa3, 0xa0, 0xa3, 0x00, 0xa3, 0x02, 0xa0, 0xaa, 0xae, 0xa4, 0xae, 0xa3, 0x02, 0xa0, 
  0x00, 0xa3, 0x02, 0xa0, 0xaa, 0xae, 0xa3, 0xae, 0x03, 0xa3, 0x00, 0xa3, 0xa0, 0xa3, 0xa4, 0xc0, 
  0x02, 0xa4, 0x02, 0xa0, 0xa3, 0x00, 0xa3, 0x03, 0xa0, 0x02, 0xa3, 0xa0, 0xa3, 0xa0, 0xa3, 0x00, 
  0x06, 0xa3, 0x03, 0xa0, 0xa3, 0x00, 0x05, 0xa0, 0x05, 0xa3, 0x00, 0x03, 0xa0, 0x04, 0xa3, 0x04, 
  0xa0, 0x00, 0x03, 0xa0, 0xa3, 0xc0, 0xa0, 0xa3, 0x04, 0xa0, 0x00, 0x02, 0xa0, 0x02, 0xa3, 0x02, 
  0xa0, 0x02, 0xa3, 0x03, 0xa0, 0x00, 0x02, 0xa0, 0xa3, 0xa0, 0xae, 0xa4, 0x05, 0xa3, 0x00, 0x02, 
  0xa0, 0xa3, 0xa4, 0xae, 0xa0, 0xa3, 0x03, 0xa0, 0xa3, 0x00, 0x03, 0xa3, 0x02, 0xae, 0xa4, 0xa3, 
  0xa0, 0xa3, 0xa0, 0xa3, 0x00, 0xa3, 0x02, 0xa0, 0x02, 0xae, 0xa4, 0x02, 0xa0, 0xa4, 0xa0, 0xa3, 
  0x00, 0xa3, 0xa0, 0xa4, 0xa0, 0xa4, 0xa0, 0xa3, 0xa0, 0x03, 0xa3, 0x00, 0x05, 0xa3, 0xa0, 0xa3, 
  0xa0, 0xa3, 0x02, 0xa0, 0x00, 0x04, 0xa0, 0xa3, 0x03, 0xa0, 0xa3, 0x02, 0xa0, 0x00, 0x04, 0xa0, 
  0x03, 0xa3, 0xae, 0xa3, 0x02, 0xa0, 0x00, 0x06, 0xa0, 0x03, 0xa3, 0x02, 0xa0, 0x00, 0x04, 0xa0, 
  0x04, 0xa3, 0x00, 0x05, 0xa3, 0x02, 0xa0, 0xa3, 0x00, 0xa3, 0x06, 0xa0, 0xa3, 0x00, 0xa3, 0xa4, 
  0xa0, 0xa4, 0xa0, 0xa4, 0xa0, 0xa3, 0x00, 0xa3, 0xae, 0xaa, 0xae, 0xaa, 0xae, 0xaa, 0xa3, 0x00, 
  0xa3, 0xaa, 0xae, 0xaa, 0xae, 0xaa, 0xae, 0xa3, 0x00, 0xa3, 0xa0, 0xa4, 0xa0, 0xa4, 0xa0, 0xa4, 
  0xa3, 0x00, 0xa3, 0x06, 0xae, 0xa3, 0x00, 0xa3, 0xae, 0xaa, 0xae, 0xaa, 0xae, 0xaa, 0xa3, 0x00, 
  0xa3, 0xa4, 0xa0, 0xa4, 0xa0, 0xa4, 0xa0, 0xa3, 0x00, 0xa3, 0xa0, 0xa4, 0xa0, 0xa4, 0xa0, 0xa4, 
  0xa3, 0x00, 0xa3, 0xa4, 0xa0, 0xa4, 0xa0, 0xa4, 0xa0, 0xa3, 0x00, 0xa3, 0x06, 0xa0, 0xa3, 0x00, 
  0xa3, 0xc0, 0xa0, 0x05, 0xa3, 0x00, 0x04, 0xa3, 0x04, 0xa0, 0x00, 0x05, 0xa0, 0x04, 0xa3, 0x00, 
  0x05, 0xa0, 0xa3, 0x02, 0xa0, 0xa3, 0x00, 0x06, 0xa3, 0xa4, 0xae, 0xa3, 0x00, 0xa3, 0x03, 0xa0, 
  0xa4, 0xa0, 0xa4, 0xae, 0xa3, 0x00, 0xa3, 0xa0, 0xa4, 0xc0, 0xa4, 0x03, 0xae, 0xa3, 0x00, 0xa3, 
  0xa0, 0x03, 0xa4, 0x02, 0xae, 0x02, 0xa3, 0x00, 0xa3, 0x02, 0xa0, 0xa4, 0xa0, 0x02, 0xae, 0xa3, 
  0xa0, 0x00, 0x08, 0xa3, 0xa0, 0x00, 0x05, 0xa3, 0xa0, 0x08, 0xa3, 0xa0, 0x00, 0xa3, 0x03, 0xa0, 
  0x03, 0xa3, 0xa0, 0xae, 0xa0, 0xa4, 0x02, 0xa0, 0xa3, 0xa0, 0x00, 0xa3, 0x03, 0xa0, 0xa4, 0xa0, 
  0xaa, 0x02, 0xae, 0xa0, 0xa3, 0xa4, 0xa0, 0x02, 0xa3, 0x00, 0x02, 0xa3, 0xa0, 0xa4, 0xa3, 0xa0, 
  0x02, 0xae, 0xaa, 0xa0, 0xa4, 0x02, 0xa0, 0xc0, 0xa3, 0x00, 0xa0, 0xa3, 0x02, 0xa0, 0xa4, 0xa0, 
  0xae, 0xa0, 0x03, 0xa3, 0x03, 0xa0, 0xa3, 0x00, 0xa0, 0x08, 0xa3, 0xa0, 0x05, 0xa3, 0x00, 0x03, 
  0xa0, 0x05, 0xa3, 0xa0, 0x04, 0xa3, 0x02, 0xa0, 0x00, 0x03, 0xa0, 0xa3, 0xc0, 0xa0, 0xae, 0x03, 
  0xa3, 0x02, 0xa0, 0x03, 0xa3, 0x00, 0x04, 0xa3, 0x02, 0xa0, 0x02, 0xa4, 0xa0, 0xa4, 0x04, 0xa0, 
  0xa3, 0x00, 0xa3, 0x03, 0xa0, 0xa3, 0xa0, 0xae, 0xa0, 0xae, 0xa0, 0x02, 0xa3, 0x02, 0xa0, 0xa3, 
  0x00, 0xa3, 0x02, 0xa0, 0xa4, 0xa0, 0xa3, 0xa0, 0xae, 0xa0, 0xae, 0xa0, 0x02, 0xa3, 0xa0, 0xa3, 
  0x00, 0x02, 0xa3, 0xa0, 0xae, 0x02, 0xa0, 0xa4, 0xa0, 0x02, 0xa4, 0x02, 0xa0, 0xa3, 0xa0, 0xa3, 
  0x00, 0xa0, 0xa3, 0xa0, 0xa3, 0x02, 0xa0, 0x03, 0xa3, 0xae, 0x02, 0xa0, 0xa3, 0xa0, 0xa3, 0x00, 
  0xa0, 0xa3, 0xa0, 0x04, 0xa3, 0xa0, 0x05, 0xa3, 0xa0, 0xa3, 0x00, 0xa0, 0xa3, 0x07, 0xa0, 0xa3, 
  0x04, 0xa0, 0xa3, 0x00, 0xa0, 0x07, 0xa3, 0xa0, 0xa3, 0xa0, 0x04, 0xa3, 0x00, 0x07, 0xa0, 0xa3, 
  0xa0, 0xae, 0xa4, 0xa0, 0xa3, 0x02, 0xa0, 0x00, 0x05, 0xa0, 0x04, 0xa3, 0x03, 0xa0, 0xa3, 0x02, 
  0xa0, 0x00, 0x05, 0xa0, 0x02, 0xa3, 0xa0, 0x05, 0xa3, 0x02, 0xa0, 0x00, 0x06, 0xa0, 0x03, 0xa3, 
  0x06, 0xa0, 0x00, 0x05, 0xa0, 0x07, 0xa3, 0x05, 0xa0, 0x00, 0x06, 0xa3, 0x05, 0xa0, 0x06, 0xa3, 
  0x00, 0xa3, 0x02, 0xa0, 0xae, 0xa0, 0x02, 0xae, 0xa4, 0xa3, 0xa4, 0x02, 0xae, 0xa0, 0xae, 0x02, 
  0xa0, 0xa3, 0x00, 0xa3, 0x02, 0xa0, 0xa4, 0xa0, 0xa4, 0x02, 0xa0, 0xae, 0x02, 0xa0, 0xa4, 0xa0, 
  0xa4, 0x02, 0xa0, 0xa3, 0x00, 0x03, 0xa3, 0xa4, 0x04, 0xa3, 0xc0, 0x04, 0xa3, 0xa4, 0x03, 0xa3, 
  0x00, 0xa3, 0x02, 0xa0, 0xa4, 0xa0, 0xa4, 0x02, 0xa0, 0xae, 0x02, 0xa0, 0xa4, 0xa0, 0xa4, 0x02, 
  0xa0, 0xa3, 0x00, 0xa3, 0x02, 0xa0, 0xae, 0xa0, 0x02, 0xae, 0xa4, 0xa3, 0xa4, 0x02, 0xae, 0xa0, 
  0xae, 0x02, 0xa0, 0xa3, 0x00, 0x06, 0xa3, 0x05, 0xa0, 0x06, 0xa3, 0x00, 0x05, 0xa0, 0x07, 0xa3, 
  0x05, 0xa0, 0x00, 0x08, 0xa0, 0x06, 0xa3, 0x00, 0x08, 0xa0, 0xa3, 0x03, 0xa0, 0x02, 0xa3, 0x00, 
  0x02, 0xa0, 0x07, 0xa3, 0xa0, 0xa4, 0x02, 0xa0, 0xa3, 0x00, 0x02, 0xa0, 0xa3, 0xa0, 0xa4, 0xa0, 
  0xa4, 0xa0, 0xa4, 0xa0, 0xa3, 0xa4, 0xa0, 0xa3, 0x00, 0x02, 0xa0, 0xa3, 0x03, 0xa0, 0xa3, 0xae, 
  0xa0, 0xa4, 0x03, 0xa0, 0xa3, 0x00, 0xa0, 0x04, 0xa3, 0xae, 0xa3, 0xae, 0xa3, 0xa0, 0xa4, 0x03, 
  0xa3, 0x00, 0xa0, 0xa3, 0x03, 0xa0, 0x05, 0xae, 0xa0, 0xa3, 0x02, 0xa0, 0x00, 0xa0, 0xa3, 0x02, 
  0xa0, 0xa4, 0xa0, 0x02, 0xae, 0x02, 0xa3, 0xa4, 0xa3, 0x02, 0xa0, 0x00, 0x03, 0xa3, 0xa0, 0x02, 
  0xa3, 0xa0, 0x02, 0xae, 0x02, 0xa0, 0xa3, 0x02, 0xa0, 0x00, 0xa3, 0x02, 0xa0, 0xa4, 0xae, 0xa3, 
  0xa4, 0xa0, 0xa3, 0xa0, 0xa4, 0xa3, 0x02, 0xa0, 0x00, 0xa3, 0x03, 0xa0, 0xa4, 0x03, 0xa0, 0xa3, 
  0x02, 0xa0, 0xa3, 0x02, 0xa0, 0x00, 0x02, 0xa3, 0xc0, 0x02, 0xa0, 0xa3, 0x02, 0xa0, 0x04, 0xa3, 
  0x02, 0xa0, 0x00, 0xa0, 0x02, 0xa3, 0x02, 0xa0, 0x04, 0xa3, 0x05, 0xa0, 0x00, 0x02, 0xa0, 0x04, 
  0xa3, 0x08, 0xa0, 0x00, 0x09, 0xa0, 0x05, 0xa3, 0x04, 0xa0, 0x00, 0x05, 0xa0, 0x05, 0xa3, 0x02, 
  0xa0, 0x05, 0xa3, 0xa0, 0x00, 0x05, 0xa0, 0xa3, 0x02, 0xa0, 0xae, 0xa3, 0xa4, 0x03, 0xa0, 0xa4, 
  0xa0, 0xa3, 0xa0, 0x00, 0x05, 0xa0, 0xa3, 0xa0, 0xa3, 0xae, 0xa0, 0x03, 0xa4, 0xa0, 0xc0, 0xa0, 
  0x02, 0xa3, 0x00, 0x05, 0xa0, 0xa3, 0x02, 0xa0, 0xae, 0xa3, 0xa4, 0x03, 0xa0, 0xa4, 0x02, 0xa0, 
  0xa3, 0x00, 0x05, 0xa0, 0x03, 0xa3, 0xae, 0xa3, 0x02, 0xa0, 0xa4, 0xa0, 0xa4, 0x02, 0xa0, 0xa3, 
  0x00, 0x07, 0xa0, 0xa3, 0xae, 0x02, 0xa0, 0x02, 0xa3, 0xa4, 0xa0, 0x03, 0xa3, 0x00, 0xa0, 0x07, 
  0xa3, 0xaa, 0x03, 0xa3, 0xae, 0xa4, 0xa0, 0xa3, 0x02, 0xa0, 0x00, 0xa0, 0xa3, 0xa0, 0xa4, 0x04, 
  0xa0, 0x04, 0xae, 0x04, 0xa3, 0x02, 0xa0, 0x00, 0x02, 0xa3, 0xa0, 0xa3, 0xa4, 0xa3, 0x02, 0xa4, 
  0x04, 0xae, 0xa3, 0x05, 0xa0, 0x00, 0xa3, 0x02, 0xa0, 0xa4, 0xa0, 0xa4, 0x03, 0xa0, 0xa3, 0x02, 
  0xae, 0xa3, 0x05, 0xa0, 0x00, 0xa3, 0x05, 0xa0, 0xa4, 0x02, 0xa0, 0xa3, 0x02, 0xae, 0xa3, 0x05, 
  0xa0, 0x00, 0xa3, 0x02, 0xa0, 0x0a, 0xa3, 0x05, 0xa0, 0x00, 0x05, 0xa3, 0x0d, 0xa0, 0x00, 0x0b, 
  0xa0, 0x04, 0xa3, 0x03, 0xa0, 0x00, 0xa0, 0x0b, 0xa3, 0x02, 0xa0, 0xa3, 0x03, 0xa0, 0x00, 0xa0, 
  0xa3, 0x02, 0xa0, 0xa4, 0xa0, 0xa4, 0xa0, 0xa4, 0xa0, 0xa4, 0x03, 0xa0, 0x02, 0xa3, 0x02, 0xa0, 
  0x00, 0xa0, 0xa3, 0x02, 0xa0, 0xa3, 0xa0, 0xa3, 0xa0, 0xa3, 0xa0, 0xa3, 0xa0, 0xa3, 0xa4, 0x02, 
  0xa3, 0x02, 0xa0, 0x00, 0xa0, 0x02, 0xa3, 0xae, 0xa0, 0xae, 0xa0, 0xae, 0xa0, 0xae, 0xa0, 0xae, 
  0xa0, 0xae, 0xa3, 0x03, 0xa0, 0x00, 0x02, 0xa0, 0xa3, 0xa4, 0xa3, 0xa0, 0xa3, 0xa0, 0xa3, 0xa0, 
  0xa3, 0xa0, 0xa3, 0xa4, 0x04, 0xa3, 0x00, 0x03, 0xa3, 0xae, 0xa0, 0xae, 0xa0, 0xae, 0xa0, 0xae, 
  0xa0, 0xae, 0xa0, 0xae, 0x03, 0xa0, 0xa3, 0x00, 0x03, 0xa3, 0xa4, 0xa3, 0xa0, 0xa3, 0xa0, 0xa3, 
  0xa0, 0xa3, 0xa0, 0xa3, 0xa0, 0xc0, 0x02, 0xa0, 0xa3, 0x00, 0x02, 0xa0, 0xa3, 0x03, 0xa0, 0xa4, 
  0xa0, 0xa4, 0xa0, 0xa4, 0xa0, 0xa4, 0x02, 0xa0, 0x03, 0xa3, 0x00, 0x02, 0xa0, 0xa3, 0x02, 0xa0, 
  0x0b, 0xa3, 0x02, 0xa0, 0x00, 0x02, 0xa0, 0x04, 0xa3, 0x0c, 0xa0, 0x00
};