require_relative '../src/longest_path_in_matrix'

describe LongestPathInMatrix do
  before(:all) do
    @longestPathInMatrix = LongestPathInMatrix.new
  end

  describe 'getPath' do
    context 'given an empty matrix' do
      it 'returns an empty path' do
        matrix = [[]]

        expect(@longestPathInMatrix.getPath(matrix)).to eql('')
      end
    end

    context 'given a 1*1 matrix' do
      it 'returns the value of the element' do
        matrix = [[3]]

        expect(@longestPathInMatrix.getPath(matrix)).to eql('3')
      end
    end

    context 'given a 2*2 matrix' do
      it 'it returns a path through the whole matrix' do
        matrix = [
          [1, 2],
          [4, 3]
        ]

        expect(@longestPathInMatrix.getPath(matrix)).to eql('1-2-3-4')
      end

      it 'it uses all elements of a row as a start' do
        matrix = [
          [4, 3],
          [2, 1]
        ]

        expect(@longestPathInMatrix.getPath(matrix)).to eql('3-4')
      end

      it 'it uses all elements of a column as a start' do
        matrix = [
          [4, 2],
          [3, 1]]

        expect(@longestPathInMatrix.getPath(matrix)).to eql('3-4')
      end
    end

    context 'given a 3*3 matrix' do
      it 'it returns a path through the whole matrix' do
        matrix = [
          [9, 8, 7],
          [4, 5, 6],
          [3, 2, 1]]

        expect(@longestPathInMatrix.getPath(matrix)).to eql('1-2-3-4-5-6-7-8-9')
      end

      it 'it returns a path through a part of the matrix' do
        matrix = [
          [1, 2, 9],
          [5, 3, 8],
          [4, 6, 7]]

        expect(@longestPathInMatrix.getPath(matrix)).to eql('6-7-8-9')
      end
    end
  end
end
